package com.adapter.apply

import android.app.Activity
import android.content.ContentValues.TAG
import android.content.Context
import android.os.Build
import android.util.Log
import android.widget.Toast
import androidx.annotation.RequiresApi
import cielo.orders.domain.Credentials
import cielo.orders.domain.Order
import cielo.sdk.order.OrderManager
import cielo.sdk.order.ServiceBindListener
import cielo.sdk.order.payment.PaymentCode
import cielo.sdk.order.payment.PaymentError
import cielo.sdk.order.payment.PaymentListener
import com.adapter.CieloChannel
import org.jetbrains.annotations.NotNull


class CieloPagamento(private val ctx: Context) : CieloChannel.CieloRun {
    var orderManager: OrderManager? = null

    override fun pay(arg: CieloChannel.PayParam?, result: CieloChannel.Result<CieloChannel.PayResponse>?) {
        val orderManager = OrderManager(Credentials(arg?.cieloCredentials!!.clientID, arg.cieloCredentials.accessToken), ctx)


        val serviceBindListener: ServiceBindListener = object : ServiceBindListener {

            override fun onServiceBoundError(throwable: Throwable) {
                Log.d("SDKClient",throwable.message.toString())
            }
            @RequiresApi(Build.VERSION_CODES.N)
            override fun onServiceBound() {
                val order = orderManager.createDraftOrder(arg.reference)
                addItemsOrder(arg, order)
                orderManager.placeOrder(order!!)
                var paymentCode = PaymentCode.values().find { it.code == arg.paymentCode }

                // SE TESTE LOCAL
                // orderManager.checkoutOrder(order.id, arg.valorTotal, makePayment(orderManager, result))

                Log.d("#######################", order.id)
                Log.d("Parametros CIELO id: ", order.id)
                Log.d("Parametros CIELO valorTotal: ", arg.valorTotal.toString())
                Log.d("Parametros CIELO items size: ", order.items.size.toString())
                Log.d("####################### ", order.id)
                // SE PRODUCAO
                orderManager.checkoutOrder(order.id, makePayment(orderManager, result))
                

            }

            override fun onServiceUnbound() {
                Log.d("SDKClient", "#### onServiceUnbound ####")
            }
        }

        orderManager.bind(ctx as Activity, serviceBindListener)
    }

    private fun addItemsOrder(arg: CieloChannel.PayParam, order: Order?) {
        (arg.items as List<HashMap<String, Object>>).forEach {
            order!!.addItem(
                    it.getValue("sku") as String,
                    it.getValue("name") as String,
                    (it.getValue("unitPrice") as Int).toLong(),
                    it.getValue("quantity") as Int,
                    it.getValue("unitOfMeasure") as String
            )
        }
    }


    private fun makePayment(orderManager: OrderManager , result: CieloChannel.Result<CieloChannel.PayResponse>? ): PaymentListener {
        return object : PaymentListener {
            override fun onStart() {
                Log.d("SDKClient", "O pagamento começou.")
            }

            override fun onPayment(@NotNull order: Order) {
                Log.d("SDKClient", "Um pagamento foi realizado. #############")
                Log.d("SDKClient",  order.status.toString())
               
                makeResponse(orderManager,order, result)
            }

            override fun onCancel() {
                Log.d("SDKClient", "A operação foi cancelada.")
                // result!!.success(CieloChannel.PayResponse())
            }

            override fun onError(@NotNull error: PaymentError) {
                Log.d("SDKClient", "Houve um erro no pagamento.")
                // result!!.success(CieloChannel.PayResponse())
            }
        }
    }


    private fun makeResponse(orderManager: OrderManager,order: Order, result: CieloChannel.Result<CieloChannel.PayResponse>?) {
        val res = CieloChannel.PayResponse()
        res.id = order.id
        res.price = order.price
        res.paidAmount = order.paidAmount
        res.pendingAmount = order.pendingAmount
        res.reference = order.reference
        res.number = order.number
        res.notes = order.notes
        res.createdAt = order.createdAt.time
        res.updatedAt = order.updatedAt.time
        res.releaseDate = order.releaseDate?.time
        res.status = order.status.ordinal.toLong()
        res.type = order.type?.ordinal?.toLong()
        res.items = order.items.map {
            mapOf(
                    "sku" to it.sku,
                    "name" to it.name,
                    "unitPrice" to it.unitPrice,
                    "quantity" to it.quantity,
                    "unitOfMeasure" to it.unitOfMeasure
            )
        }.toList()
        res.payments = order.payments.map {
            mapOf(
                    "externalId" to it.externalId,
                    "description" to it.description,
                    "cieloCode" to it.cieloCode,
                    "authCode" to it.authCode,
                    "brand" to it.brand,
                    "mask" to it.mask,
                    "terminal" to it.terminal,
                    "amount" to it.amount,
                    "primaryCode" to it.primaryCode,
                    "secondaryCode" to it.secondaryCode,
                    "applicationName" to it.applicationName,
                    "requestDate" to it.requestDate,
                    "merchantCode" to it.merchantCode,
                    "discountedAmount" to it.discountedAmount,
                    "installments" to it.installments,
                    "paymentFields" to it.paymentFields,
                    "accessKey" to it.accessKey
            )
        }.toList()
        // order.close();
        result!!.success(res)
    }
}
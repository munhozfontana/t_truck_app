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
    val ordersResponse = emptyMap<Any, Any>()

    override fun pay(arg: CieloChannel.PayParam?, result: CieloChannel.Result<CieloChannel.PayResponse>?) {
        val orderManager = OrderManager(Credentials(arg?.cieloCredentials!!.clientID, arg.cieloCredentials.accessToken), ctx)

        try {
            val serviceBindListener: ServiceBindListener = object : ServiceBindListener {

                override fun onServiceBoundError(throwable: Throwable) {
                    Log.d("SDKClient #### ", "ERROR INTERNO")
                    returnToFlutter(result)
                }
    
                @RequiresApi(Build.VERSION_CODES.N)
                override fun onServiceBound() {
                    try {
                        Log.d("SDKClient", "#### onServiceBound ####")
                        val order = orderManager.createDraftOrder(arg.reference)
                        order!!.addItem(arg.sku, arg.description, arg.unit_price, arg.quantity.toInt(), arg.unit_of_measure)
                        orderManager.placeOrder(order)
                        orderManager.checkoutOrder(order.id, makePayment(result, orderManager))
                    } catch (e) {
                        returnToFlutter(result, e.stackTrace.toString())
                    }
                }
    
                override fun onServiceUnbound() {
                    Log.d("SDKClient", "#### onServiceUnbound ####")
                    returnToFlutter(result)
                }
            }
            orderManager.bind(ctx as Activity, serviceBindListener)
        } catch (e) {
            returnToFlutter(result, e.stackTrace.toString())
        }
         
    }




    private fun makePayment(result: CieloChannel.Result<CieloChannel.PayResponse>? ,orderManager: OrderManager): PaymentListener {
        return object : PaymentListener {
            override fun onStart() {
                Log.d("SDKClient", "#### Start PaymentListener ####")
            }

            override fun onPayment(@NotNull order: Order) {

                try {
               Log.d("SDKClient", "#### Um pagamento foi realizado. ####")
                order.close()
                ordersResponse.plus(Pair("order" , order))   
                } catch (e) {
                    returnToFlutter(result, e.stackTrace.toString())
                }
                
            }

            override fun onCancel() {
                Log.d("SDKClient", "#### A operação foi cancelada. ####")
              
            }

            override fun onError(@NotNull error: PaymentError) {
                Log.d("SDKClient", "#### Houve um erro no pagamento. ####")
            }
        }
    }


    private fun unbindCielo(orderManager: OrderManager) {
        Log.d("SDKClient", "#### UNBIND ####")
        orderManager.unbind();
    }


    private fun returnToFlutter(result: CieloChannel.Result<CieloChannel.PayResponse>?,  error: String = "Sem Erro") {
        var response = CieloChannel.PayResponse();
        response.orders = ordersResponse
        Log.d("SDKClient", "#### VOLTANDO PARA O FLUTTER ####")
        response.error = error
        result!!.success(response)
    }

 


}
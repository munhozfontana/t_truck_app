package com.adapter.apply;


import cielo.orders.domain.Credentials;
import cielo.orders.domain.Order;
import cielo.sdk.order.*;
import cielo.sdk.order.payment.PaymentError;
import cielo.sdk.order.payment.PaymentListener;

import android.app.Activity;
import android.content.Context;
import android.util.Log;


import com.adapter.CieloChannel;

import org.jetbrains.annotations.NotNull;

public class  CieloPagamentoGSA implements CieloChannel.CieloRun {
    private  Context context;

    public CieloPagamentoGSA(Context context) {
        this.context = context;
    }


    @Override
    public void pay(CieloChannel.PayParam arg, CieloChannel.Result<CieloChannel.PayResponse> result) {

        //Credenciais
        Credentials credentials = new Credentials("8L24NGKvA1ZqIITT10GcV6Iln2vi5qaNuvyoVUwDMaqUfr8tq2", "tYVLDVObE71O49xiGfOoSz2fEwS61uTKUR3wvn0B8KSlMHcFpl");
        OrderManager orderManager = new OrderManager(credentials, context);


        ServiceBindListener serviceBindListener = new ServiceBindListener() {

            @Override public void onServiceBoundError(Throwable throwable) {
                orderManager.unbind();
            }

            @Override
            public void onServiceBound() {
                final Order order = orderManager.createDraftOrder("GSA PEDIDOS");

                String sku = "2891820317391823";
                String name = "Coca-cola lata";

                order.addItem(sku, name, 1, 3, "UNIDADE");


              final PaymentListener paymentListener = new PaymentListener() {
                    @Override
                    public void onStart() {
                        new DebugLog().remoteLog("O pagamento começou.");
                        Log.d("SDKClient", "O pagamento começou.");
                    }

                    @Override
                    public void onPayment(@NotNull Order order) {
                        new DebugLog().remoteLog("Um pagamento foi realizado.");
                        Log.d("SDKClient", "Um pagamento foi realizado.");

                    }

                    @Override public void onCancel() {
                        new DebugLog().remoteLog("A operação foi cancelada.");
                        Log.d("SDKClient", "A operação foi cancelada.");
                    }

                    @Override public void onError(@NotNull PaymentError paymentError) {
                        new DebugLog().remoteLog("Houve um erro no pagamento.");
                        Log.d("SDKClient", "Houve um erro no pagamento.");
                    }
                };

                orderManager.placeOrder(order);
                orderManager.checkoutOrder(order.getId(), paymentListener);
               
            }

            @Override
            public void onServiceUnbound() {
                orderManager.unbind();
            }
        };

        orderManager.bind((Activity) context, serviceBindListener);
    }




    @Override
    public void paySync2(CieloChannel.PayParam arg, CieloChannel.Result<Void> result) {

    }

    @Override
    public void paySync(CieloChannel.PayParam arg) {

    }
}
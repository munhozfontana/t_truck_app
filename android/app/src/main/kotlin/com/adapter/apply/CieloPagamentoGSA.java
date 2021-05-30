package com.adapter.apply;


import cielo.orders.domain.Credentials;
import cielo.orders.domain.Order;
import cielo.sdk.order.*;
import cielo.sdk.order.payment.Payment;
import cielo.sdk.order.payment.PaymentError;
import cielo.sdk.order.payment.PaymentListener;

import android.app.Activity;
import android.content.Context;
import android.util.Log;


import com.adapter.CieloChannel;

import org.jetbrains.annotations.NotNull;

import java.util.HashMap;
import java.util.Map;

public class  CieloPagamentoGSA implements CieloChannel.CieloRun {
    private  Context context;

    public CieloPagamentoGSA(Context context) {
        this.context = context;
    }


    @Override
    public void pay(CieloChannel.PayParam arg, CieloChannel.Result<CieloChannel.PayResponse> result) {

        //Credenciais
        Credentials credentials = new Credentials(arg.getCieloCredentials().getClientID(), arg.getCieloCredentials().getAccessToken());
        OrderManager orderManager = new OrderManager(credentials, context);


        ServiceBindListener serviceBindListener = new ServiceBindListener() {
            

            @Override public void onServiceBoundError(Throwable throwable) {
                new DebugLog().remoteLog("### onServiceBoundError ###");
            }

            @Override
            public void onServiceBound() {
                
                    
                new DebugLog().remoteLog("### onServicebound ###");
               final Order order = orderManager.createDraftOrder(arg.getReference());

               order.addItem(arg.getSku(), arg.getDescription(), arg.getUnit_price(), arg.getQuantity().intValue(), arg.getUnit_of_measure());

             final  PaymentListener paymentListener = new PaymentListener() {
                    @Override
                    public void onStart() {
                        new DebugLog().remoteLog("O pagamento começou.");
                        Log.d("SDKClient", "O pagamento começou.");

                    }

                    @Override 
                    public void onPayment(@NotNull  final Order order) {

                        new Thread(new Runnable() {
                            @Override
                            public void run() {
                                new DebugLog().remoteLog("Um pagamento foi realizado.".concat(order.toString()));
                                Log.d("SDKClient", "Um pagamento foi realizado.");
                                order.close();
                            }
                        }).start();


                        try {
                            CieloChannel.PayResponse buildSucess =  new CieloChannel.PayResponse();
                            new DebugLog().remoteLog("Enviando.... ");
                            buildSucess.setId(order.getId());
                            result.success(buildSucess);
                        } catch ( Exception e) {
                            new DebugLog().remoteLog("Error ao montar a resposta: ".concat(e.getMessage()));
                        }

                    }

                    @Override public void onCancel() {
                        new DebugLog().remoteLog("Erro no pagamento");
                        Log.d("SDKClient", "A operação foi cancelada.");

                    }

                    @Override public void onError(@NotNull PaymentError paymentError) {
                       new DebugLog().remoteLog("Erro no pagamento");
                        Log.d("SDKClient", "Houve um erro no pagamento.");

                    }
                };

                orderManager.placeOrder(order);
                orderManager.checkoutOrder(order.getId(), 5, paymentListener);
                orderManager.unbind();
            }


            @Override
            public void onServiceUnbound() {
                // O serviço foi desvinculado
                //Toast.makeText(getApplicationContext(), "onServiceUnbound O serviço foi desvinculado", Toast.LENGTH_LONG).show();
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
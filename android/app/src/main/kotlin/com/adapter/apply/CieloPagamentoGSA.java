package com.adapter.apply;


import cielo.orders.domain.Credentials;
import cielo.orders.domain.Order;
import cielo.sdk.order.*;
import cielo.sdk.order.payment.Payment;
import cielo.sdk.order.payment.PaymentError;
import cielo.sdk.order.payment.PaymentListener;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.util.Log;


import androidx.annotation.RequiresApi;

import com.adapter.CieloChannel;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class  CieloPagamentoGSA implements CieloChannel.CieloRun {
    private  Context context;
    private ArrayList itemsToReturn = new ArrayList();

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

            @RequiresApi(api = Build.VERSION_CODES.N)
            @Override
            public void onServiceBound() {

                new DebugLog().remoteLog("### onServicebound ###");
               final Order order = orderManager.createDraftOrder(arg.getReference());


               try {
                   arg.getItems()
                           .stream()
                           .map(item -> ((HashMap) item))
                           .forEach(itemMap ->
                                   order.addItem(
                                           (String) itemMap.get("sku"),
                                           (String) itemMap.get("name"),
                                           (int) itemMap.get("unitPrice"),
                                           (int) itemMap.get("quantity"),
                                           (String) itemMap.get("unitOfMeasure"))
                           );
               }   catch ( Exception e) { 
                new DebugLog().remoteLog("### INTERANDO LISTA  ### : ".concat(e.getMessage()) );
               }


             final  PaymentListener paymentListener = new PaymentListener() {
                    @Override
                    public void onStart() {
                        new DebugLog().remoteLog("O pagamento começou.");
                        Log.d("SDKClient", "O pagamento começou.");

                    }

                    @Override 
                    public void onPayment(@NotNull  final Order order) {

                        new Thread(() -> {
                            new DebugLog().remoteLog("Um pagamento foi realizado.".concat(order.toString()));
                            Log.d("SDKClient", "Um pagamento foi realizado.");
                            order.close();
                        }).start();

                        try {
                            CieloChannel.PayResponse buildSucess =  new CieloChannel.PayResponse();
                            new DebugLog().remoteLog("Enviando.... ");
                            result.success(buildOrder(order, buildSucess));
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
                orderManager.checkoutOrder(order.getId(), 1, paymentListener);
                orderManager.unbind();
            }


            @Override
            public void onServiceUnbound() {
                new DebugLog().remoteLog("#### onServiceUnbound  ###");
                Log.d("SDKClient", "#### onServiceUnbound  ###");
            }
        };


        orderManager.bind((Activity) context, serviceBindListener);
    }

    @RequiresApi(api = Build.VERSION_CODES.N)
    private CieloChannel.PayResponse buildOrder(Order order, CieloChannel.PayResponse buildSucess) {

        List<HashMap> paymentFields = new ArrayList<>();
        buildSucess.setPaidAmount(order.getPaidAmount());
        order.getPayments().forEach(item -> {
            HashMap paymentItem = new HashMap();
            paymentItem.put("externalId", item.getExternalId());
            paymentItem.put("description", item.getDescription());
            paymentItem.put("cieloCode", item.getCieloCode());
            paymentItem.put("authCode", item.getAuthCode());
            paymentItem.put("brand", item.getBrand());
            paymentItem.put("mask", item.getMask());
            paymentItem.put("terminal", item.getTerminal());
            paymentItem.put("amount", item.getAmount());
            paymentItem.put("primaryCode", item.getPrimaryCode());
            paymentItem.put("secondaryCode", item.getSecondaryCode());
            paymentItem.put("applicationName", item.getApplicationName());
            paymentItem.put("requestDate", item.getRequestDate());
            paymentItem.put("merchantCode", item.getMerchantCode());
            paymentItem.put("discountedAmount", item.getDiscountedAmount());
            paymentItem.put("installments", item.getInstallments());
            paymentItem.put("paymentFields", item.getPaymentFields());
            paymentItem.put("accessKey", item.getAccessKey());
            paymentFields.add(paymentItem);
        });
        buildSucess.setPayments(Collections.singletonList(paymentFields));


    return buildSucess;


    }

}
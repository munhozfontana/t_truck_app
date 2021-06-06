package com.adapter.apply;

import android.app.Activity;
import android.content.Context;
import android.os.Build;
import android.util.Log;
import androidx.annotation.RequiresApi;
import cielo.orders.domain.Credentials;
import cielo.orders.domain.Order;
import cielo.sdk.order.*;
import cielo.sdk.order.payment.Payment;
import cielo.sdk.order.payment.PaymentError;
import cielo.sdk.order.payment.PaymentListener;
import com.adapter.CieloChannel;
import com.google.gson.GsonBuilder;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;

public class CieloPagamentoGSA implements CieloChannel.CieloRun {

  private Context context;
  List<Object> paymentFields;
  long paidAmount;
  OrderManager orderManager;

  public CieloPagamentoGSA(Context context) {
    this.context = context;
  }

  @Override
  public void pay(CieloChannel.PayParam arg){
    Credentials credentials = new Credentials(
      arg.getCieloCredentials().getClientID(),
      arg.getCieloCredentials().getAccessToken()
    );

    orderManager = new OrderManager(credentials, context);

    ServiceBindListener serviceBindListener = new ServiceBindListener() {
      @Override
      public void onServiceBoundError(Throwable throwable) {}

      @Override
      public void onServiceBound() {
        final Order order = orderManager.createDraftOrder(arg.getReference());

        try {
          for (Object item : arg.getItems()) {
            HashMap itemMap = (HashMap) item;
            order.addItem(
              (String) itemMap.get("sku"),
              (String) itemMap.get("name"),
              Long.valueOf((int) itemMap.get("unitPrice")),
              (int) itemMap.get("quantity"),
              (String) itemMap.get("unitOfMeasure")
            );
          }
        } catch (Exception e) {
          Utils.dialog(context, e.getMessage());
        }

        final PaymentListener paymentListener = new PaymentListener() {
          @Override
          public void onStart() {
            Log.d("SDKClient", "O pagamento começou.");
          }

          @Override
          public void onPayment(@NotNull final Order order) {
            new Thread(() -> order.close()).start();

            paidAmount = order.getPaidAmount();
            List<Object> paymentFieldsLocal = new ArrayList<>();
            if (order.getPayments().size() != 0) {
              for (Payment payment : order.getPayments()) {
                HashMap hashMap = new HashMap();

                hashMap.put(
                        "externalId",
                        payment.getExternalId() == null ? "" : payment.getExternalId()
                );
                hashMap.put(
                        "description",
                        payment.getDescription() == null ? "" : payment.getDescription()
                );
                hashMap.put(
                        "cieloCode",
                        payment.getCieloCode() == null ? "" : payment.getCieloCode()
                );
                hashMap.put(
                        "brand",
                        payment.getBrand() == null ? "" : payment.getBrand()
                );
                hashMap.put("mask", payment.getMask() == null ? "" : payment.getMask());
                hashMap.put(
                        "terminal",
                        payment.getTerminal() == null ? "" : payment.getTerminal()
                );
                hashMap.put("amount", payment.getAmount());
                hashMap.put(
                        "primaryCode",
                        payment.getPrimaryCode() == null ? "" : payment.getPrimaryCode()
                );
                hashMap.put(
                        "secondaryCode",
                        payment.getSecondaryCode() == null ? "" : payment.getSecondaryCode()
                );
                hashMap.put(
                        "applicationName",
                        payment.getApplicationName() == null
                                ? ""
                                : payment.getApplicationName()
                );
                hashMap.put(
                        "requestDate",
                        payment.getRequestDate() == null ? "" : payment.getRequestDate()
                );
                hashMap.put(
                        "merchantCode",
                        payment.getMerchantCode() == null ? "" : payment.getMerchantCode()
                );
                hashMap.put("discountedAmount", payment.getDiscountedAmount());
                hashMap.put("installments", payment.getInstallments());
                hashMap.put(
                        "paymentFields",
                        payment.getPaymentFields() == null ? "" : payment.getPaymentFields()
                );
                hashMap.put(
                        "accessKey",
                        payment.getAccessKey() == null ? "" : payment.getAccessKey()
                );
                paymentFieldsLocal.add(hashMap);
              }
            }

            paymentFields = paymentFieldsLocal;
          }

          @Override
          public void onCancel() {}

          @Override
          public void onError(@NotNull PaymentError paymentError) {}
        };

        try {
          orderManager.placeOrder(order);
          orderManager.checkoutOrder(order.getId(),paymentListener);
          orderManager.unbind();
        } catch (Exception e) {
          Utils.dialog(context, e.getMessage());
        }
      }

      @Override
      public void onServiceUnbound() {
        Log.d("SDKClient", "#### onServiceUnbound  ###");
      }
    };

    orderManager.bind((Activity) context, serviceBindListener);
  }


  @Override
  public void responsePayments(CieloChannel.Result<CieloChannel.PayResponse> result) {
    CieloChannel.PayResponse res = new CieloChannel.PayResponse();
    res.setPayments(paymentFields);
    res.setPaidAmount(paidAmount);
    result.success(res);
    orderManager.unbind();
    Log.d("SDKClient", "#### responsePayments  ###");
  }
}

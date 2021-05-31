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
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jetbrains.annotations.NotNull;
import org.json.JSONArray;

public class CieloPagamentoGSA implements CieloChannel.CieloRun {

  private Context context;
  private ArrayList itemsToReturn = new ArrayList();

  public CieloPagamentoGSA(Context context) {
    this.context = context;
  }

  @Override
  public void pay(
    CieloChannel.PayParam arg,
    CieloChannel.Result<CieloChannel.PayResponse> result
  ) {

    Credentials credentials = new Credentials(
      arg.getCieloCredentials().getClientID(),
      arg.getCieloCredentials().getAccessToken()
    );

    OrderManager orderManager = new OrderManager(credentials, context);

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
            result.success(buildOrder(order,  new CieloChannel.PayResponse()));
          }

          @Override
          public void onCancel() {}

          @Override
          public void onError(@NotNull PaymentError paymentError) {}
        };

        try {
          orderManager.placeOrder(order);
          orderManager.checkoutOrder(order.getId(), paymentListener);
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


  private CieloChannel.PayResponse buildOrder(
    Order order,
    CieloChannel.PayResponse buildSucess
  ) {
    List<Object> paymentFields = new ArrayList<>();
    buildSucess.setPaidAmount(order.getPaidAmount());



    HashMap hashMap = new HashMap();
      if(order.getPayments().size() != 0) {
          hashMap.put("cieloCode" , order.getPayments().get(0).getCieloCode() == null ? "" :  order.getPayments().get(0).getCieloCode());
          paymentFields.add(hashMap);
      }




   /*   HashMap paymentItem = new HashMap();
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
      paymentFields.add(paymentItem);*/

    buildSucess.setPayments(paymentFields);
    return buildSucess;
  }
}

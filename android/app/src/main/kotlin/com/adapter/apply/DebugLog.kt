package com.adapter.apply

import android.util.Log
import okhttp3.*
import org.json.JSONObject
import java.io.IOException


public class DebugLog  {

    public   fun  remoteLog(e: String) {
      try {
          val dados = JSONObject()
          dados.put("content" , e)
        val client = OkHttpClient()
        val request: Request = Request.Builder()
        .url("http://192.168.0.14:4000/api/debug")
        //.url("http://10.0.0.102:4000/api/debug")
                .post(RequestBody.create(
                        MediaType.parse("application/json; charset=utf-8"),
                        dados.toString()))
                .build()

          client.newCall(request)
                  .enqueue(object : Callback {
                      override fun onFailure(call: Call?, e: IOException?) {
                          Log.d("SDKClient", "CERROR AO CHAMAR API: " + e?.message)

                      }
                      @Throws(IOException::class)
                      override fun onResponse(call: Call?, response: Response) {

                          Log.d("SDKClient", "SUCESSO AO CHAMAR API: " + response.code())

                      }
                  })

      } catch (e : Exception ) {
        Log.d("SDKClient", "ERRO AO CHAMAR O OKHTTP ", e)
      }

    }

}


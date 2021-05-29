package com.example.t_truck_app

import com.adapter.CieloChannel
import com.adapter.apply.CieloPagamentoGSA
import com.adapter.apply.DebugLog
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine



class MainActivity: FlutterActivity() {

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {

        try {

            super.configureFlutterEngine(flutterEngine)
            CieloChannel.CieloRun.setup(flutterEngine.dartExecutor.binaryMessenger, CieloPagamentoGSA(this));
        } catch (e: Exception){
            e.message?.let { DebugLog().remoteLog(it) }
        }


    }




}

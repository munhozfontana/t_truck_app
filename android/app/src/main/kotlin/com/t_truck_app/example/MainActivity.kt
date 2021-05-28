package com.example.t_truck_app

import io.flutter.embedding.android.FlutterActivity
import com.adapter.CieloChannel
import com.adapter.apply.CieloPagamento
import com.adapter.apply.CieloPagamentoGSA
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

        override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        
        CieloChannel.CieloRun.setup(flutterEngine.dartExecutor.binaryMessenger, CieloPagamentoGSA(this));
    }
    
}

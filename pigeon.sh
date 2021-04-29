flutter pub run pigeon \
    --input generators/cielo_channel_gen.dart \
    --dart_out lib/features/data/external/channels/cielo_channel.dart \
    --java_out ./android/app/src/main/kotlin/com/adapter/CieloChannel.java \
    --java_package "com.adapter"



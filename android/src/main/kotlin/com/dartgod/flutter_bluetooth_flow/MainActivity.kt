package com.dartgod.flutter_bluetooth_flow

import com.dartgod.flutter_bluetooth_flow.bluetooth.domain.toMap
import com.dartgod.flutter_bluetooth_flow.bluetooth.plugin.BluetoothClient
import com.dartgod.flutter_bluetooth_flow.bluetooth.plugin.BluetoothServer
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterFragmentActivity() {
    private lateinit var bluetoothClient: BluetoothClient
    private lateinit var bluetoothServer: BluetoothServer
    private val clientBluetoothDataEventChannel = "com.dartgod/client_data_event_channel"
    private val clientBluetoothOnConnectedEventChannel = "com.dartgod/client_on_connected_event_channel"
    private val bluetoothScanDeviceEventChannel = "com.dartgod/client_scan_device_event_channel"
    private val bluetoothScanModeEventChannel = "com.dartgod/client_scan_mode_event_channel"

    private val bluetoothClientMethods = "com.dartgod/bluetooth_client_methods"

    private val serverBluetoothDataEventChannel = "com.dartgod/server_data_event_channel"
    private val serverBluetoothOnConnectedEventChannel = "com.dartgod/server_on_connected_event_channel"

    private val serverBluetoothMethods = "com.dartgod/bluetooth_server_methods"


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        bluetoothClient = BluetoothClient(this)
        bluetoothServer = BluetoothServer(this)

        configureClientEventChannels(flutterEngine)
        configureClientMethodChannel(flutterEngine)

        configureServerEventChannels(flutterEngine)
        configureServerMethodChannel(flutterEngine)
    }

    private fun configureServerMethodChannel(flutterEngine: FlutterEngine) {
        val methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, serverBluetoothMethods
        )
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "updateServerUUID" -> {
                    val uuidSeed = call.argument<String>("uuidSeed")
                    bluetoothServer.let {
                        when (uuidSeed) {
                            null -> result.error(
                                "Invalid UUID", "UUID is null",
                                null
                            )
                            else -> {
                                it.updateServerUUID(uuidSeed)
                                result.success(null)
                            }
                        }
                    }
                }
                "initialize" -> {
                    bluetoothServer.initialize()
                    result.success(null)
                }
                "isBluetoothEnabled" -> {
                    result.success(bluetoothServer.isBluetoothEnabled())
                    result.success(null)
                }
                "startServer" -> {
                    bluetoothServer.startServer()
                    result.success(null)
                }
                "stopServer" -> {
                    bluetoothServer.stopServer()
                    result.success(null)
                }
                "send" -> {
                    val data = call.argument<ByteArray>("data")
                    bluetoothServer.sendData(data!!)
                    result.success(null)
                }
                "release" -> {
                    bluetoothServer.release()
                    result.success(null)
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    private fun configureServerEventChannels(flutterEngine: FlutterEngine) {
        configureServerOnConnectedEventChannel(flutterEngine)
        configureServerOnDataEventChannel(flutterEngine)
    }

    private fun configureServerOnConnectedEventChannel(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, serverBluetoothOnConnectedEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothServer.setConnectedListener {
                    eventSink?.success(it)
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothServer.removeConnectedListener()
            }
        })
    }

    private fun configureServerOnDataEventChannel(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, serverBluetoothDataEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothServer.setDataEventListener {
                    eventSink?.success(it)
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothServer.removeDataEventListener()
            }
        })
    }


    private fun configureClientMethodChannel(flutterEngine: FlutterEngine) {
        val methodChannel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger, bluetoothClientMethods
        )
        methodChannel.setMethodCallHandler { call, result ->
            when (call.method) {
                "isBluetoothEnabled" -> {
                    result.success(bluetoothClient.isBluetoothEnabled())
                }
                "send" -> {
                    val data = call.argument<ByteArray>("data")
                    if (data != null) {
                        bluetoothClient.send(data)
                    }
                }
                "disconnect" -> {
                    bluetoothClient.disconnect()
                }
                "connect" -> {
                    val address = call.argument<String>("deviceAddress")
                    bluetoothClient.let {
                        when {
                            address != null -> it.connect(address)
                            else -> result.error(
                                "Invalid address",
                                "Address is null",
                                null
                            )
                        }
                    }

                }
                "fetchPairedDevices" -> {
                    val devices = bluetoothClient.fetchPairedDevices()
                    result.success(devices.map { it.toMap() })
                }
                "startScan" -> {
                    bluetoothClient.startScan()
                }
                "stopScan" -> {
                    bluetoothClient.stopScan()
                }
                "release" -> {
                    bluetoothClient.release()
                }
                else -> {
                    result.notImplemented()
                }
            }

        }
    }

    private fun configureClientEventChannels(flutterEngine: FlutterEngine) {
        addDataEventListener(flutterEngine)
        addConnectedEventListener(flutterEngine)
        scanDeviceEventListener(flutterEngine)
        scanModeEventListener(flutterEngine)
    }

    private fun scanModeEventListener(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, bluetoothScanModeEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothClient.setScanModeListener {
                    eventSink?.success(it.value)
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothClient.removeScanModeListener()
            }
        })
    }

    private fun scanDeviceEventListener(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, bluetoothScanDeviceEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothClient.setScannedDevicesListener {
                    eventSink?.success(it.toMap())
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothClient.removeScannedDevicesListener()
            }
        })
    }

    private fun addConnectedEventListener(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, clientBluetoothOnConnectedEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothClient.setConnectedListener {
                    eventSink?.success(it)
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothClient.removeConnectedListener()
            }
        })

    }

    private fun addDataEventListener(flutterEngine: FlutterEngine) {
        val eventChannel = EventChannel(
            flutterEngine.dartExecutor.binaryMessenger, clientBluetoothDataEventChannel
        )

        eventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            private var eventSink: EventChannel.EventSink? = null

            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                eventSink = events
                bluetoothClient.setDataEventListener {
                    eventSink?.success(it)
                }
            }

            override fun onCancel(arguments: Any?) {
                eventSink = null
                bluetoothClient.removeDataEventListener()
            }
        })
    }
}


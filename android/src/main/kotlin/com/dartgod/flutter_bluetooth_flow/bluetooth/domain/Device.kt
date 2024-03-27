package com.dartgod.flutter_bluetooth_flow.bluetooth.domain

import android.annotation.SuppressLint
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothDevice


data class PDevice(
    val name: String,
    val address: String,
    val isPaired: Boolean = false,
    val isConnected: Boolean,
)

fun PDevice.toMap(): Map<String, Any> {
    return mapOf(
        "name" to name, "address" to address, "isPaired" to isPaired, "isConnected" to isConnected
    )
}


@SuppressLint("MissingPermission")
fun BluetoothDevice.toPDevice(): PDevice {
    return PDevice(
        name = name,
        address = address,
        isPaired = bondState == BluetoothDevice.BOND_BONDED,
        isConnected = false
    )
}

@SuppressLint("MissingPermission", "HardwareIds")
fun BluetoothAdapter.thisDevice(): PDevice {
    return PDevice(
        name = this.name, address = this.address, isPaired = false, isConnected = false
    )
}
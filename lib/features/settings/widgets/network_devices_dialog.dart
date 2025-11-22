import 'package:easacc/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:permission_handler/permission_handler.dart';

class NetworkDevicesDialog extends StatefulWidget {
  const NetworkDevicesDialog({super.key});

  @override
  State<NetworkDevicesDialog> createState() => _NetworkDevicesDialogState();
}

class _NetworkDevicesDialogState extends State<NetworkDevicesDialog> {
  String? selectedDeviceId;
  List<ScanResult> devices = <ScanResult>[];
  bool bluetoothOn = true;
  bool isConnecting = false;

  @override
  void initState() {
    super.initState();
    checkBluetoothAndPermissions();
  }

  Future<void> checkBluetoothAndPermissions() async {
    if (!await FlutterBluePlus.isSupported) {
      debugPrint('Bluetooth not supported');
      setState(() => bluetoothOn = false);
      return;
    }

    bool isOn = await FlutterBluePlus.isOn;
    if (!isOn) {
      setState(() => bluetoothOn = false);
      return;
    }

    // Request permissions before scanning
    final PermissionStatus statusScan = await Permission.bluetoothScan.request();
    final PermissionStatus statusConnect = await Permission.bluetoothConnect.request();
    final PermissionStatus statusLocation = await Permission.location.request();

    if (!statusScan.isGranted || !statusConnect.isGranted || !statusLocation.isGranted) {
      // Permission denied
      setState(() => bluetoothOn = false);
      return;
    }

    setState(() => bluetoothOn = true);
    scanForDevices();
  }

  void scanForDevices() async {
    devices.clear();

    await FlutterBluePlus.startScan(timeout: const Duration(seconds: 5));

    FlutterBluePlus.scanResults.listen((List<ScanResult> results) {
      for (ScanResult result in results) {
        if (!devices.any((ScanResult d) => d.device.remoteId == result.device.remoteId)) {
          devices.add(result);
        }
      }
      setState(() {});
    });
  }

  void connectToDevice(BluetoothDevice device) async {
    setState(() => isConnecting = true);
    await FlutterBluePlus.stopScan();

    try {
      await device.connect(license: License.free);

      if (!mounted) return;

      // Close the dialog
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Device "${device.platformName.isEmpty ? device.remoteId : device.platformName}" connected successfully'),
          backgroundColor: context.colorScheme.primary,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to connect to device'),
          backgroundColor: context.colorScheme.error,
        ),
      );
    }
    setState(() => isConnecting = false);
  }

  @override
  void dispose() {
    FlutterBluePlus.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      insetPadding: const EdgeInsets.all(24),
      title: Row(
        children: <Widget>[
          Text(
            context.l10n.settings_network_devices,
            style: context.textTheme.titleLarge?.semibold.copyWith(color: context.colorScheme.primary),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
      content: !bluetoothOn
          ? Text(
              context.l10n.network_devices_bluetooth_off,
              style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.error),
            )
          : devices.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : DropdownButton<String>(
              itemHeight: 60,
              value: selectedDeviceId,
              hint: Text(context.l10n.network_devices_select_device),
              isExpanded: true,
              items: devices.map((ScanResult device) {
                final String name = device.advertisementData.advName.isEmpty
                    ? context.l10n.network_devices_unknown_device
                    : device.advertisementData.advName;
                return DropdownMenuItem<String>(
                  value: device.device.remoteId.str,
                  child: Text(
                    '$name (${device.device.remoteId.str})',
                    style: context.textTheme.bodyMedium,
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedDeviceId = value;
                });
              },
            ),
      actions: <Widget>[
        TextButton(
          child: Text(
            context.l10n.network_devices_cancel,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.onSurfaceVariant),
          ),
          onPressed: () => Navigator.pop(context),
        ),
        FilledButton(
          onPressed: (!bluetoothOn || selectedDeviceId == null)
              ? null
              : () {
                  final BluetoothDevice device = devices.firstWhere((ScanResult d) => d.device.remoteId.str == selectedDeviceId!).device;
                  connectToDevice(device);
                },
          child: isConnecting
              ? SizedBox(
                  height: 16,
                  width: 16,
                  child: CircularProgressIndicator(
                    color: context.colorScheme.onPrimary,
                    strokeWidth: 2,
                  ),
                )
              : Text(context.l10n.network_devices_connect),
        ),
      ],
    );
  }
}

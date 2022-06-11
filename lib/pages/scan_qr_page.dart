import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';

class ScanQrPage extends StatefulWidget {
  final String eventId;

  const ScanQrPage({
    Key? key,
    @pathParam required this.eventId,
  }) : super(key: key);

  @override
  State<ScanQrPage> createState() => _ScanQrPageState();
}

class _ScanQrPageState extends State<ScanQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SCAN QR'),
      ),
      body: Center(
        child: PrettyQr(
          // image: AssetImage('images/twitter.png'),
          typeNumber: 3,
          size: 200,
          data: widget.eventId,
          errorCorrectLevel: QrErrorCorrectLevel.M,
          roundEdges: true,
        ),
      ),
    );
  }
}

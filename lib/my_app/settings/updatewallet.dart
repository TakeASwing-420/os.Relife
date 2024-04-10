import 'dart:io';

import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:Relife/core/app_export.dart';
import 'package:flutter/services.dart';

class UpdatePage extends StatefulWidget {
  final String username;

  const UpdatePage({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  late W3MService _w3mService;
  late SnackBar snackBar;
  bool _updating = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _initializeService();
  }

  void _initializeService() async {
    _w3mService = W3MService(
      projectId: "bf8a7c7b20908cbb470ae88ea9969ac1",
      logLevel: LogLevel.error,
      metadata: const PairingMetadata(
        name: "os.Relife",
        description: "an app targeted for socially challenged persons",
        url: 'https://www.walletconnect.com/',
        icons: ['https://web3modal.com/images/rpc-illustration.png'],
        redirect: Redirect(
          native: 'flutterdapp://',
          universal: 'https://www.walletconnect.com',
        ),
      ),
    );
    await _w3mService.init();
  }

  Future<bool> _updateUser() async {
    try {
      setState(() {
        _updating = true;
      });
      await DBMSHelper.updatewallet(
        widget.username,
        _w3mService.address!,
      );
      Navigator.of(context).pop();
      return true;
    } on SocketException {
      final errorMessage = "Network problem";
      snackBar = SnackBar(
        elevation: 20.v,
        content: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(width: 5.h),
              Icon(
                Icons.error_outline,
                size: 35.adaptSize,
                color: Colors.white,
              ),
              SizedBox(width: 5.h),
              Text(
                '$errorMessage',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        backgroundColor: Colors.deepOrange,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        width: SizeUtils.width,
        height: SizeUtils.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(0.13, 0.05),
            end: Alignment(0.59, 0.99),
            colors: [
              appTheme.red300,
              appTheme.gray300,
              appTheme.whiteA700,
              appTheme.whiteA700
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 80.v),
            W3MConnectWalletButton(
              service: _w3mService,
            ),
            SizedBox(height: 10.v),
            W3MNetworkSelectButton(service: _w3mService),
            SizedBox(height: 10.v),
            W3MAccountButton(service: _w3mService),
            SizedBox(height: 40.v),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(84.v)),
              ),
              height: 32.v,
              width: 180.h,
              child: ElevatedButton(
                onPressed: _updating ? null : _updateUser,
                style: ButtonStyle(
                  backgroundColor: _updating
                      ? MaterialStateProperty.all<Color>(Colors.transparent)
                      : MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: _updating
                    ? CircularProgressIndicator()
                    : Text('Update Wallet',
                        style: TextStyle(
                            fontSize: 16.fSize,
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.w600)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

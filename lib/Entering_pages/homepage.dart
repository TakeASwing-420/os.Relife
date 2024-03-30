import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:Relife/core/app_export.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String password;
  final String confirm_password;

  const HomePage({
    Key? key,
    required this.username,
    required this.password,
    required this.confirm_password,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late W3MService _w3mService;
  late SnackBar snackBar;
  bool _registering = false;
  String? _privateKey;
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

  Future<bool> _registerUser() async {
    try {
      setState(() {
        _registering = true;
      });
      _privateKey = await DBMSHelper.registerUser(
        widget.username,
        widget.password,
        widget.confirm_password,
        _w3mService.address!,
      );

      _showPrivateKeySnackbar();
      return true;
    } catch (error) {
      final errorMessage = error.toString().substring(11);
      snackBar = SnackBar(
        elevation: 20.v,
        content: Row(
          children: [
            Expanded(
              child: Icon(
                Icons.error_outline,
                size: 35.adaptSize,
                color: Colors.white,
              ),
            ),
            SizedBox(width: 5.h),
            Text(
              '$errorMessage',
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
            ),
          ],
        ),
        backgroundColor: Colors.deepOrange,
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.of(context).pop();
      return false;
    }
  }

  void _showPrivateKeySnackbar() {
    snackBar = SnackBar(
      elevation: 20.v,
      content: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Your private key is $_privateKey',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
                Text(
                  'Keep this key very safe',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () async {
              Clipboard.setData(ClipboardData(text: _privateKey!));
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              await Navigator.pushNamed(
                  context, AppRoutes.challengeContainerScreen);
            },
            child: Container(
              width: 67.v,
              height: 21.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(55.v)),
                color: Colors.white,
              ),
              child: Center(
                child: Text(
                  'Copy',
                  style: CustomTextStyles.titleSmallDeeporangeA200,
                ),
              ),
            ),
          ),
        ],
      ),
      duration: Duration(days: 1),
      backgroundColor: Colors.orange,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
            W3MConnectWalletButton(service: _w3mService),
            SizedBox(height: 10.v),
            W3MNetworkSelectButton(service: _w3mService),
            SizedBox(height: 10.v),
            W3MAccountButton(service: _w3mService),
            SizedBox(height: 40.v),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(62.v)),
              ),
              height: 32.v,
              width: 180.h,
              child: ElevatedButton(
                onPressed: _registering ? null : _registerUser,
                style: ButtonStyle(
                  backgroundColor: _registering
                      ? MaterialStateProperty.all<Color>(Colors.transparent)
                      : MaterialStateProperty.all<Color>(Colors.white),
                ),
                child: _registering
                    ? CircularProgressIndicator()
                    : Text('Register',
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

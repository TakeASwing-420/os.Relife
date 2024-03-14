import 'package:flutter/material.dart';
import 'package:web3modal_flutter/web3modal_flutter.dart';
import 'package:deep_s_application3/core/app_export.dart';
import 'package:slider_button/slider_button.dart';

class HomePage extends StatefulWidget {
  final String username;
  final String password;

  const HomePage({Key? key, required this.username, required this.password})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late W3MService _w3mService;
  String? _address;

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
        name: "BurstTheMyth",
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

    setState(() {
      _address = _w3mService.address;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              alignment: Alignment.center,
              child: SliderButton(
                action: () async {
                  Navigator.pushNamed(
                      context, AppRoutes.challengeContainerScreen);
                  return null;
                },
                label: const Text('Slide to login'),
                icon: Icon(Icons.check, size: 20.adaptSize),
              ),
            )
          ],
        ),
      ),
    );
  }
}

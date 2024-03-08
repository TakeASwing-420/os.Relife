import 'dart:async';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:flutter/material.dart';
import 'package:deep_s_application3/widgets/gradient_button.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final ScrollController _controller = ScrollController();
  double _scrollOffset = 0.0;
  final double _scrollSpeed = 20.0;
  int currentDuration = 0;
  String currentLyric = ' ';
  double volume_val = 0;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.animateTo(
        _scrollOffset,
        duration: const Duration(milliseconds: 500),
        curve: Curves.linear,
      );

      _scrollOffset += _scrollSpeed;
      if (_scrollOffset >= _controller.position.maxScrollExtent) {
        _scrollOffset = 0.0;
      }

      _startAutoScroll();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 27.0),
          SingleChildScrollView(
            controller: _controller,
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: RichText(
                    text: TextSpan(
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w500),
                      children: const [
                        TextSpan(
                          text: "Feeling sad about being an  ",
                        ),
                        TextSpan(
                          text: "Unsocial",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: "customfont",
                            fontStyle: FontStyle.italic,
                            letterSpacing: 2.0,
                            fontSize: 44,
                            color: Colors.amberAccent,
                          ),
                        ),
                        TextSpan(
                          text: "? ",
                          style: TextStyle(
                            fontSize: 60,
                            color: Colors.redAccent,
                          ),
                        ),
                        TextSpan(
                          text: "We got you!",
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: GradientBoxBorder(
                  gradient: LinearGradient(colors: [
                    Colors.pinkAccent,
                    Colors.deepPurpleAccent,
                    Colors.deepPurpleAccent,
                    Colors.redAccent
                  ]),
                  width: 4,
                ),
                color: Color.fromARGB(255, 192, 212, 221),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
                image: DecorationImage(
                  image: AssetImage('assets/images/BTM.png'),
                  fit: BoxFit.fill,
                ),
              ),
              width: 500,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 390),
                  Container(
                    margin: const EdgeInsets.all(5),
                    alignment: Alignment.center,
                    child: GradientLoginButton(),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.center,
                    child: const SizedBox(
                      height: 37,
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: GradientRegisterButton(),
                  ),
                  const SizedBox(height: 23),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:deep_s_application3/widgets/gradient_button.dart';
import 'package:deep_s_application3/core/app_export.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late List<Widget> _tasks = [];
  late GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addTiles();
    });
  }

  Future<void> _addTiles() async {
    for (int i = 0; i < customList.length; i++) {
      await Future.delayed(const Duration(milliseconds: 50));
      _tasks.add(customList[i]);
      _listKey.currentState
          ?.insertItem(_tasks.length - 1, duration: const Duration(seconds: 1));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 12.v, bottom: 12.v),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fs.png'),
                fit: BoxFit.cover,
              ),
            ),
            alignment: Alignment.center,
          ),
          Center(
            child: SizedBox(
              height: 290.v,
              width: 376.h,
              child: Card(
                color: Colors.white70.withOpacity(0.84),
                margin: EdgeInsets.all(37.v),
                child: Padding(
                  padding: EdgeInsets.all(20.v),
                  child: AnimatedList(
                    key: _listKey,
                    initialItemCount: _tasks.length,
                    itemBuilder: (context, index, animation) {
                      return SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0.23, 0),
                          end: Offset.zero,
                        ).animate(animation),
                        child: _tasks[index],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> customList = [
    SizedBox(height: 7.v),
    Text("Already have an account? Login",
        style: CustomTextStyles.labelLarge12),
    SizedBox(height: 7.v), // Adjust the height as needed
    GradientLoginButton(),
    SizedBox(height: 7.v), // Adjust the height as needed
    Text("Don't have an yet? Create a free account",
        style: CustomTextStyles.labelLarge12),
    SizedBox(height: 7.v), // Adjust the height as needed
    GradientRegisterButton(),
    // Adjust the height as needed
  ];
}

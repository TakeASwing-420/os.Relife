import 'dart:async';
import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:pedometer/pedometer.dart';
import '../../core/app_export.dart';
import "map.dart";
import 'package:Relife/widgets/custom_elevated_button.dart';
import "package:Relife/my_app/challenge_page/challenge_page.dart";

class FitnessTrackerDetailsScreen extends StatefulWidget {
  final LatLng initialCenter;
  final int challengeIndex;
  final int CreditScore;
  FitnessTrackerDetailsScreen(
      {Key? key,
      required this.initialCenter,
      required this.CreditScore,
      required this.challengeIndex})
      : super(key: key);

  @override
  State<FitnessTrackerDetailsScreen> createState() =>
      _FitnessTrackerDetailsScreenState();
}

class _FitnessTrackerDetailsScreenState
    extends State<FitnessTrackerDetailsScreen> {
  late Stream<StepCount> _stepCountStream;
  late Stream<PedestrianStatus> _pedestrianStatusStream;
  String _status = '?', _steps = '?';
  bool _fetching = false;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  void onStepCount(StepCount event) {
    setState(() {
      _steps = event.steps.toString();
    });
  }

  void onPedestrianStatusChanged(PedestrianStatus event) {
    setState(() {
      _status = event.status;
    });
  }

  void onPedestrianStatusError(error) {
    setState(() {
      _status = 'Pedestrian Status not available';
    });
    print(_status);
  }

  void onStepCountError(error) {
    setState(() {
      _steps = 'Step Count not available';
    });
  }

  void initPlatformState() async {
    _pedestrianStatusStream = Pedometer.pedestrianStatusStream;
    _pedestrianStatusStream
        .listen(onPedestrianStatusChanged)
        .onError(onPedestrianStatusError);
    _stepCountStream = Pedometer.stepCountStream;
    _stepCountStream.listen(onStepCount).onError(onStepCountError);
    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          width: double.maxFinite,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 692.v,
                  width: double.maxFinite,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      _buildStackmap(context),
                      _buildStackvectorfour(context)
                    ],
                  ),
                ),
                SizedBox(height: 36.v),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStackmap(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        height: 378.v,
        width: double.maxFinite,
        child: Stack(
          alignment: Alignment.centerRight,
          children: [MapScreen(initialCenter: widget.initialCenter)],
        ),
      ),
    );
  }

  Widget _buildStackvectorfour(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 0,
        margin: EdgeInsets.all(0),
        color: appTheme.deepOrange500,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusStyle.roundedBorder20,
        ),
        child: Container(
          height: 337.v,
          width: double.maxFinite,
          decoration: AppDecoration.gradientDeepOrangeToRed.copyWith(
            borderRadius: BorderRadiusStyle.roundedBorder20,
          ),
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(
                    top: 20.v,
                    right: 41.h,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 35.v),
                      Padding(
                        padding: EdgeInsets.only(left: 20.h),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 59.h),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: _steps,
                                      style: CustomTextStyles.titleMediumGray50,
                                    ),
                                    TextSpan(
                                      text: "   ",
                                    ),
                                    TextSpan(
                                      text: "steps so far",
                                      style: CustomTextStyles
                                          .titleMediumWhiteA70001,
                                    )
                                  ],
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Divider(
                        indent: 30.h,
                        thickness: 2,
                        color: Colors.white,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 15.h),
                        child: Center(
                          child: Icon(
                            _status == 'walking'
                                ? Icons.directions_walk
                                : _status == 'stopped'
                                    ? Icons.accessibility_new
                                    : Icons.error,
                            size: 100,
                          ),
                        ),
                      ),
                      SizedBox(height: 10.v),
                      Padding(
                        padding: EdgeInsets.only(left: 19.h),
                        child: Center(
                          child: Text(_status,
                              style:
                                  _status == 'walking' || _status == 'stopped'
                                      ? CustomTextStyles.labelLargeWhiteA700
                                      : CustomTextStyles.labelLargeWhiteA700
                                          .copyWith(color: Colors.black)),
                        ),
                      ),
                      SizedBox(height: 15.v),
                      Padding(
                        padding: EdgeInsets.only(left: 24.h),
                        child: Center(
                          child: _fetching
                              ? CircularProgressIndicator()
                              : CustomElevatedButton(
                                  onPressed: () async {
                                    setState(() {
                                      _fetching = true;
                                    });
                                    await DBMSHelper.fetchTokens(
                                        widget.CreditScore);
                                    await DBMSHelper.setChallenges(
                                        widget.challengeIndex, false);
                                    await Future.delayed(Duration(seconds: 5));
                                    await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ChallengePage(),
                                      ),
                                    );
                                  },
                                  text: "Stop",
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 22.h),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

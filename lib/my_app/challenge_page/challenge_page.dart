import 'dart:io';

import '../challenge_page/widgets/challengelist_item_widget.dart';
import 'package:Relife/core/app_export.dart';
import 'package:Relife/widgets/app_bar/appbar_title.dart';
import 'package:Relife/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({Key? key}) : super(key: key);

  @override
  State<ChallengePage> createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  late String userBalance;
  List<bool> challengeList = [false, false, false, false, false, false];

  @override
  void initState() {
    super.initState();
    userBalance = '0';
    fetchUserBalance();
    fetchUserTasks();
  }

  Future<void> fetchUserBalance() async {
    try {
      final String balance = await DBMSHelper.getCoins();
      setState(() {
        userBalance = balance;
      });
    } on SocketException {
      setState(() {
        userBalance = "Error";
      });
      final errorMessage = "Network Error";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
      );
    }
  }

  Future<void> fetchUserTasks() async {
    try {
      final List<bool> challenge_List = await DBMSHelper.get_challenges();
      setState(() {
        challengeList = challenge_List;
      });
    } on SocketException {
      final errorMessage = "Network Error";
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
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
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.deepOrange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.transparent,
        appBar: _buildAppBar(context),
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.13, 0.05),
              end: Alignment(0.59, 0.99),
              colors: [appTheme.red300, appTheme.gray300],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(horizontal: 9.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(height: 16.v),
                  coinDisplay(),
                  SizedBox(height: 20.v),
                  ChallengelistItemWidget(
                    challengeIndex: 0,
                    isActive: challengeList[0],
                    participationFee: 1000,
                    creditScore: 2000,
                    imagePath: ImageConstant.img1669Logo385x375,
                  ),
                  SizedBox(height: 8.v),
                  ChallengelistItemWidget(
                    challengeIndex: 1,
                    isActive: challengeList[1],
                    creditScore: 500,
                    imagePath: ImageConstant.img1669Logo,
                  ),
                  SizedBox(height: 8.v),
                  ChallengelistItemWidget(
                    challengeIndex: 2,
                    isActive: challengeList[2],
                    participationFee: 1500,
                    creditScore: 2500,
                    imagePath: ImageConstant.img1616Logo,
                  ),
                  SizedBox(height: 8.v),
                  ChallengelistItemWidget(
                    challengeIndex: 3,
                    isActive: challengeList[3],
                    participationFee: 500,
                    creditScore: 1000,
                    imagePath: ImageConstant.img1669Logo385x375,
                  ),
                  SizedBox(height: 8.v),
                  ChallengelistItemWidget(
                    challengeIndex: 4,
                    isActive: challengeList[4],
                    creditScore: 500,
                    imagePath: ImageConstant.img1759Logo,
                  ),
                  SizedBox(height: 8.v),
                  ChallengelistItemWidget(
                    challengeIndex: 5,
                    isActive: challengeList[5],
                    creditScore: 100,
                    imagePath: ImageConstant.img1669Logo385x375,
                  ),
                  SizedBox(height: 16.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget coinDisplay() {
    return Row(
      children: [
        Spacer(),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.adaptSize),
            color: Colors.white,
          ),
          margin: EdgeInsets.only(top: 40.h, right: 12.v),
          height: 40.v,
          width: 171.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 3.v, horizontal: 8.h),
                child: CircleAvatar(
                  backgroundImage: AssetImage(ImageConstant.coin),
                  radius: 22.adaptSize,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 8.h),
                child: TweenAnimationBuilder<int>(
                  duration: Duration(milliseconds: 1500),
                  tween:
                      IntTween(begin: 0, end: int.tryParse(userBalance) ?? 0),
                  builder: (context, value, _) {
                    return Text(
                      value.toString(),
                      style: TextStyle(
                        fontSize: 16.fSize,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Challenges",
      ),
    );
  }
}

import 'dart:io';

import 'widgets/profilesection_item_widget.dart';
import 'package:Relife/core/app_export.dart';
import 'package:Relife/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:Relife/my_app/doctor_details/doctor_details.dart';

class UserProfileItemData {
  final String imagePath;
  final String name;
  final int creditScore;

  UserProfileItemData({
    required this.imagePath,
    required this.name,
    required this.creditScore,
  });
}

class Iphone13MiniTwentyScreen extends StatefulWidget {
  Iphone13MiniTwentyScreen({Key? key}) : super(key: key);

  @override
  State<Iphone13MiniTwentyScreen> createState() =>
      _Iphone13MiniTwentyScreenState();
}

class _Iphone13MiniTwentyScreenState extends State<Iphone13MiniTwentyScreen> {
  TextEditingController searchController = TextEditingController();

  late SnackBar snackBar;
  late String userBalance;

  @override
  void initState() {
    super.initState();
    userBalance = '0';
    fetchUserBalance();
  }

  Future<void> fetchUserBalance() async {
    try {
      await Future.delayed(Duration(seconds: 5));
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
          content: Row(
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
          backgroundColor: Colors.deepOrange,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 4.v),
                        SizedBox(
                            height: 811.v,
                            width: double.maxFinite,
                            child:
                                Stack(alignment: Alignment.topRight, children: [
                              Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.h, vertical: 4.v),
                                      decoration:
                                          AppDecoration.gradientDeepOrangeToRed,
                                      child: SingleChildScrollView(
                                        child: Column(children: [
                                          SizedBox(height: 28.v),
                                          coinDisplay(),
                                          _buildLetsFindServiceSection(context),
                                          SizedBox(height: 13.v),
                                          CustomSearchView(
                                              textStyle: CustomTextStyles
                                                  .titleSmallBlack900,
                                              autofocus: false,
                                              controller: searchController,
                                              hintText: "Search"),
                                          SizedBox(height: 72.v),
                                          _buildUserProfileSection(context),
                                          SizedBox(height: 155.v),
                                        ]),
                                      ))),
                              _buildFilterSection(context)
                            ]))
                      ])),
            )));
  }

  /// Section Widget
  Widget _buildLetsFindServiceSection(BuildContext context) {
    return SizedBox(
        height: 125.v,
        width: 335.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  width: 320.h,
                  child: Text("Lets find a \nservice provider",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.headlineMedium))),
          CustomImageView(
              imagePath: ImageConstant.imgImage6,
              height: 40.adaptSize,
              width: 40.adaptSize,
              alignment: Alignment.bottomRight,
              margin: EdgeInsets.only(right: 123.h, bottom: 37.v)),
        ]));
  }

  /// Section Widget
  Widget _buildUserProfileSection(BuildContext context) {
    List<UserProfileItemData> userData = [
      UserProfileItemData(
        imagePath: ImageConstant.imgFrame62,
        name: 'Dr. Alan Smith',
        creditScore: 2000,
      ),
      UserProfileItemData(
        imagePath: ImageConstant.imgFrame621,
        name: 'Dr. Marcus Aminoff',
        creditScore: 2500,
      ),
      UserProfileItemData(
        imagePath: ImageConstant.imgFrame623,
        name: 'Dr. John Doe',
        creditScore: 3500,
      ),
      UserProfileItemData(
        imagePath: ImageConstant.imgFrame6240x40,
        name: 'Dr. Rachelle Sedith',
        creditScore: 2500,
      ),
    ];

    return ListView.separated(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      separatorBuilder: (context, index) {
        return SizedBox(height: 4.v);
      },
      itemCount: userData.length,
      itemBuilder: (context, index) {
        UserProfileItemData data = userData[index];
        return UserprofilesectionItemWidget(
          imagePath: data.imagePath,
          name: data.name,
          creditScore: data.creditScore,
          onTapUserProfile: () {
            onTapUserProfile(context, data.creditScore);
          },
        );
      },
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

  /// Section Widget
  Widget _buildFilterSection(BuildContext context) {
    return Align(
        alignment: Alignment.topLeft,
        child: Container(
            child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("All"),
                  backgroundColor: Colors.deepOrangeAccent,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("General practitioner"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("Neurologist"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("Surgeon"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Chip(
                  label: Text("Psychiatrist"),
                ),
              ),
            ],
          ),
        )));
  }

  /// Shows a modal bottom sheet with [Iphone13MiniTwentyoneBottomsheet]
  /// widget content.
  /// The sheet is displayed on top of the current view with scrolling enabled if
  /// content exceeds viewport height.
  void onTapUserProfile(BuildContext context, int amount) {
    // Close the virtual keyboard if it's open
    FocusManager.instance.primaryFocus?.unfocus();

    // Show the user profile bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (_) => Iphone13MiniTwentythreeScreen(creditScore: amount),
      isScrollControlled: true,
    );
  }
}

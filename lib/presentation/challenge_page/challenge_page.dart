import '../challenge_page/widgets/challengelist_item_widget.dart';
import 'package:deep_s_application3/core/app_export.dart';
import 'package:deep_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:deep_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:flutter/material.dart';

// ignore_for_file: must_be_immutable
class ChallengePage extends StatelessWidget {
  const ChallengePage({Key? key})
      : super(
          key: key,
        );

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
              colors: [
                appTheme.red300,
                appTheme.gray300,
              ],
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
                  _buildChallengeList(context),
                  SizedBox(height: 16.v),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      centerTitle: true,
      title: AppbarTitle(
        text: "Challenges",
      ),
    );
  }

  /// Section Widget
  Widget _buildChallengeList(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.h, right: 8.h),
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 8.v,
          );
        },
        itemCount: 8,
        itemBuilder: (context, index) {
          return ChallengelistItemWidget();
        },
      ),
    );
  }
}

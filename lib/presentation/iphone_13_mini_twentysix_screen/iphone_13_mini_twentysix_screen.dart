import '../iphone_13_mini_twentysix_screen/widgets/visitlist_item_widget.dart';
import 'package:deep_s_application3/core/app_export.dart';

import 'package:flutter/material.dart';

class Iphone13MiniTwentysixScreen extends StatelessWidget {
  const Iphone13MiniTwentysixScreen({Key? key})
      : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        body: Container(
          width: SizeUtils.width,
          height: SizeUtils.height,
          decoration: BoxDecoration(
            color: appTheme.black900,
            boxShadow: [
              BoxShadow(
                color: appTheme.deepOrange700.withOpacity(0.5),
                spreadRadius: 2.h,
                blurRadius: 2.h,
                offset: Offset(
                  0,
                  0,
                ),
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment(0, 0),
              end: Alignment(1, 1.03),
              colors: [
                appTheme.deepOrange40001,
                appTheme.red700,
              ],
            ),
          ),
          child: Container(
            width: double.maxFinite,
            padding: EdgeInsets.symmetric(
              horizontal: 20.h,
              vertical: 1.v,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 18.v),
                _buildAddVisitStack(context),
                SizedBox(height: 19.v),
                _buildVisitList(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// Section Widget
  Widget _buildAddVisitStack(BuildContext context) {
    return SizedBox(
      height: 105.v,
      width: 332.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              "My Visits",
              style: theme.textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  /// Section Widget
  Widget _buildVisitList(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        physics: BouncingScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (
          context,
          index,
        ) {
          return SizedBox(
            height: 3.v,
          );
        },
        itemCount: 7,
        itemBuilder: (context, index) {
          return VisitlistItemWidget();
        },
      ),
    );
  }
}

import '../iphone_13_mini_twenty_screen/widgets/userprofilesection_item_widget.dart';
import 'package:deep_s_application3/core/app_export.dart';
import 'package:deep_s_application3/widgets/custom_search_view.dart';
import 'package:flutter/material.dart';
import 'package:deep_s_application3/presentation/iphone_13_mini_twentythree_screen/iphone_13_mini_twentythree_screen.dart';

// ignore_for_file: must_be_immutable
class Iphone13MiniTwentyScreen extends StatelessWidget {
  Iphone13MiniTwentyScreen({Key? key}) : super(key: key);

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(),
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: SizedBox(
                  width: double.maxFinite,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: 1.v),
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
                                          SizedBox(height: 15.v),
                                          _buildLetsFindServiceSection(context),
                                          SizedBox(height: 13.v),
                                          CustomSearchView(
                                              controller: searchController,
                                              hintText: "Search"),
                                          SizedBox(height: 72.v),
                                          _buildUserProfileSection(context),
                                          SizedBox(height: 42.v),
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
        height: 141.v,
        width: 335.h,
        child: Stack(alignment: Alignment.bottomRight, children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: SizedBox(
                  width: 205.h,
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
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (context, index) {
          return SizedBox(height: 4.v);
        },
        itemCount: 5,
        itemBuilder: (context, index) {
          return UserprofilesectionItemWidget(onTapUserProfile: () {
            onTapUserProfile(context);
          });
        });
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
  void onTapUserProfile(BuildContext context) {
    // Close the virtual keyboard if it's open
    FocusManager.instance.primaryFocus?.unfocus();

    // Show the user profile bottom sheet
    showModalBottomSheet(
      context: context,
      builder: (_) => Iphone13MiniTwentythreeScreen(),
      isScrollControlled: true,
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../components/app_components.dart';
import '../../../main.dart';
import '../../../routes/app_routes.dart';
import '../../../values/styles/colors.dart';
import '../../../values/styles/constans.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageController pageController = PageController(initialPage: 0);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 50,
        backgroundColor: appStore.isDarkModeOn ? scaffoldDarkColor : white,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Good Morning 👋", style: secondaryTextStyle()),
            const SizedBox(height: 5),
            Text("Andrew Desuza", style: boldTextStyle()),
          ],
        ),
        leading: GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, bottom: 8, left: 16),
            child: Image.asset("assets/userImage.jpg", fit: BoxFit.cover).cornerRadiusWithClipRRect(60),
          ),
          onTap: () {
            Get.toNamed(Routes.profile);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none_rounded, size: 22, color: defaultColor),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.favorite_border_rounded, size: 22, color: defaultColor),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                style: primaryTextStyle(),
                onFieldSubmitted: (val) {},
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                  hintText: 'Search',
                  hintStyle: secondaryTextStyle(),
                  fillColor: appStore.isDarkModeOn ? cardDarkColor : editTextBgColor,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: radius(defaultRadius),
                    borderSide:const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: radius(defaultRadius),
                    borderSide:const BorderSide(color: Colors.transparent, width: 0.0),
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.search, size: 20, color: appStore.isDarkModeOn ? white : gray.withOpacity(0.5)),
                    onPressed: () {},
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      size: 20,
                      color: appStore.isDarkModeOn ? white : gray.withOpacity(0.5),
                    ),
                    onPressed: () {},
                  ),
                ),
              ),
            ).paddingSymmetric(horizontal: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Special Offer", style: boldTextStyle(size: 18)),
                TextButton(
                  onPressed: () {},
                  child: Text('See All', style: Theme.of(context).textTheme.bodyText2),
                ),
              ],
            ).paddingOnly(left: 16, right: 8),
            GestureDetector(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 230,
                child: Stack(
                  children: [
                    PageView.builder(
                      controller: pageController,
                      itemCount: ListOfCarImg.length,
                      itemBuilder: (context, index) => Container(
                        padding:const EdgeInsets.all(16),
                        margin:const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 8),
                        decoration: BoxDecoration(
                          color: appStore.isDarkModeOn ? cardDarkColor : primaryColor.shade300,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text.rich(
                                TextSpan(
                                  text: '20%\n\n',
                                  style: boldTextStyle(size: 26),
                                  children: [
                                    TextSpan(text: 'Week Deals!\n\n', style: boldTextStyle(size: 16)),
                                    TextSpan(
                                      text: 'Get a new car discount, \nonly valid this week',
                                      style: secondaryTextStyle(size: 14),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Image(image: AssetImage(ListOfCarImg[index])),
                            )
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment:const Alignment(0, 0.75),
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 5,
                        effect: CustomizableEffect(activeDotDecoration: LightActiveDecoration, dotDecoration: LightDecoration),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),

          ],
        ),
      ),
    );
  }
}

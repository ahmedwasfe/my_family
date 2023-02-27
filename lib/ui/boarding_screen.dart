
import 'package:flutter/material.dart';
import 'package:flutter_hex_color/flutter_hex_color.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/boarding_controller.dart';
import 'package:my_family/model/splash.dart';
import 'package:my_family/routes/routes.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/components.dart';
import 'package:my_family/utils/constants.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingScreen extends GetView<BoardingController> {
  final _controller = Get.put(BoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      body: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          /*FutureBuilder(
              future: _controller.getBoarding(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.done){
                  if(_controller.listBoarding.isNotEmpty){
                    return PageView.builder(
                      controller: _controller.pageController,
                      physics: const BouncingScrollPhysics(),
                        itemCount: _controller.listBoarding.isNotEmpty ? _controller.listBoarding.length : 3,
                        itemBuilder: (context, index) => controller.listBoarding.isNotEmpty ? pageViewScreens(_controller.listBoarding[index]) : pageViewScreensTest(index),
                      onPageChanged: (index) {
                        if (index == _controller.listBoarding.length - 1) {
                          _controller.isLast.value = true;
                        } else {
                          _controller.isLast.value = false;
                        }
                      });
                  }else{
                    return Container();
                  }
                }else if(snapshot.connectionState == ConnectionState.waiting){
                  return PageView.builder(
                      controller: _controller.pageController,
                      physics: const BouncingScrollPhysics(),
                      itemCount: 3,
                      itemBuilder: (context, index) => pageViewScreensTest(index),
                      onPageChanged: (index) {
                        if (index == _controller.listBoarding.length - 1) {
                          _controller.isLast.value = true;
                        } else {
                          _controller.isLast.value = false;
                        }
                      });
                }else{
                  print("TEST NO DATA");
                  return Container(height: 100, width: 100, color: Colors.amber, child: pageViewScreensTest(0),);
                }
              }),*/
      PageView.builder(
      controller: _controller.pageController,
          physics: const BouncingScrollPhysics(),
          itemCount: 3,
          itemBuilder: (context, index) => pageViewScreensTest(index),
          onPageChanged: (index) {
            if (index == _controller.listBoarding.length - 1) {
              _controller.isLast.value = true;
            } else {
              _controller.isLast.value = false;
            }
          }),
          Container(
            height: 220.h,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppWidgets.CustomButton(
                    width: 280.w,
                    height: 48.h,
                    radius: 14.r,
                    background: AppHelper.getAppTheme(),
                    borderColor: AppHelper.getAppTheme(),
                    fontWeight: FontWeight.w700,
                    isUpperCase: false,
                    text: 'join_our_community'.tr, click: () => _controller.goToLogin(isLogin: false)),
                SizedBox(height: 20.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText.medium(text: 'already_member'),
                    SizedBox(width: 10.w),
                    InkWell(child: AppText.larg(text: 'login', color: AppHelper.getAppTheme()),
                    onTap: () => _controller.goToLogin(isLogin: true)),
                  ],
                ),
                Spacer(),
                Container(
                  margin: EdgeInsetsDirectional.only(bottom: 28.r, start: 10.r, end: 10.r),
                  height: 20,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(child: AppText.medium(text: 'skip', fontWeight: FontWeight.w500, color: AppColors.colorSubText),
                      onTap: () => _controller.goToLogin(isLogin: true)),
                      SmoothPageIndicator(
                        controller: _controller.pageController,
                        count: 3,
                        effect: CustomizableEffect(
                          dotDecoration: DotDecoration(
                            height: 6.h,
                            width: 15.w,
                            color: HexColor(AppColors.grayColor),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          activeDotDecoration: DotDecoration(
                            height: 6.h,
                            width: 35.w,
                            color: AppHelper.getAppTheme(),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                        ),
                        onDotClicked: (index) {
                          if (_controller.isLast.value) {
                            _controller.pageController.previousPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInToLinear);
                          } else {
                            _controller.pageController.nextPage(
                                duration: const Duration(milliseconds: 750),
                                curve: Curves.easeInToLinear);
                          }
                        },
                      ),
                      InkWell(
                          child: AppText.medium(text: 'next', fontWeight: FontWeight.w500, color: AppHelper.getAppTheme()),
                      onTap: (){
                        if (_controller.isLast.value) {
                          print('LAST');
                          _controller.goToLogin(isLogin: true);
                        } else {
                          print('NEXT');
                          _controller.pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.easeInToLinear);
                        }
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget pageViewScreens(SplashData boarding) => Container(
    margin: EdgeInsets.only(top: 20.r),
    child: Stack(
      alignment: Alignment.topCenter,
      children: [
        SizedBox(
          height: 400,
          width: double.infinity,
          child: Image.network('${boarding.imageUrl}',
              fit: BoxFit.contain),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 180.0).r,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                child: AppText.medium(
                  fontWeight: FontWeight.w500,
                    text: boarding.description!,
                textAlign: TextAlign.start,
                maxline: 3),
              ),
            ],
          ),
        ),
      ],
    ),
  );

  Widget pageViewScreensTest(int index) {
    if(index == 0){

      return Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset('${Const.images}boarding1.png',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                    child: AppText.medium(
                        fontWeight: FontWeight.w500,
                        text: 'test_desc1',
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }else if(index == 1){
      return Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset('${Const.images}boarding2.png',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                    child: AppText.medium(
                        fontWeight: FontWeight.w500,
                        text: 'test_desc2',
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }else if(index == 2){
      return Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset('${Const.images}boarding3.png',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                    child: AppText.medium(
                        fontWeight: FontWeight.w500,
                        text: 'test_desc3',
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }else {
      return Container(
        margin: EdgeInsets.only(top: 20.r),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            SizedBox(
              height: 400,
              width: double.infinity,
              child: Image.asset('${Const.images}boarding1.png',
                  fit: BoxFit.contain),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 180.0).r,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsetsDirectional.only(start: 20.r, end: 20.r),
                    child: AppText.medium(
                        fontWeight: FontWeight.w500,
                        text: 'test_desc1',
                        textAlign: TextAlign.start,
                        maxline: 3),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }
  }
}

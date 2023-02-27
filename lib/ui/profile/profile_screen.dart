import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_family/controller/profile_controller.dart';
import 'package:my_family/utils/app_color.dart';
import 'package:my_family/utils/app_helper.dart';
import 'package:my_family/utils/app_text.dart';
import 'package:my_family/utils/constants.dart';

class ProfileScreen extends GetView<ProfileController> {
  ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackground,
      appBar: AppBar(
        backgroundColor: AppHelper.getAppTheme(),
        elevation: 0,
        title: AppText.medium(
            fontWeight: FontWeight.w700,
            fontSize: 18,
            text: 'Profile',
            color: Colors.white),
        toolbarHeight: 60.h,
        centerTitle: true,
        leading: InkWell(
            child: SvgPicture.asset(
              AppHelper.iconBack(),
              height: 26.h,
              width: 26.w,
              fit: BoxFit.scaleDown,
            ),
            onTap: () => Navigator.maybePop(context)),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //TODO Row Image && Icon
              // Container(
              //   margin: const EdgeInsetsDirectional.only(top: 32),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceAround,
              //     children: [
              //       Container(
              //         width: 40.w,
              //         height: 40.h,
              //         child: Card(
              //           elevation: 5,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(20).r,
              //           ),
              //           child: Image.asset(
              //             '${Const.images}location.png',
              //           ),
              //         ),
              //       ),
              //       CircleAvatar(
              //         radius: 45.r,
              //         backgroundImage:  AssetImage(
              //           '${Const.images}profil.png',
              //         ),
              //       ),
              //       Container(
              //         alignment: AlignmentDirectional.centerStart,
              //         width: 40.w,
              //         height: 40.h,
              //         child: Card(
              //           elevation: 5,
              //           shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(22).r,
              //           ),
              //           child: Container(
              //             alignment: AlignmentDirectional.center,
              //             child:  Image.asset(
              //               '${Const.images}location.png',
              //             ),
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
             //TODO Text
              Container(
                alignment: AlignmentDirectional.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 14.h,
                    ),
                    AppText.larg(
                        text: 'Gwen Stacy',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.lightBlue7),
                    SizedBox(
                      height: 5.h,
                    ),
                    AppText.medium(
                      text: 'parent',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
             //TODO Text
              Container(
                margin: const EdgeInsetsDirectional.only(start: 35, top: 37),
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(
                    text: 'email', fontWeight: FontWeight.w400, fontSize: 16),
              ),
             //TODO Text
              Container(
                margin: const EdgeInsetsDirectional.only(start: 35, top: 0),
                alignment: AlignmentDirectional.topStart,
                child: AppText.medium(
                    text: 'gwen@gmail.com',
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                    color: AppColors.lightGray),
              ),
              SizedBox(
                height: 20.h,
              ),
              //TODO Divider
              const Divider(
                indent: 17,
                endIndent: 17,
                color: AppColors.colorSubText,
                thickness: 0.8,
              ),
              //TODO Text
              Container(
                margin: EdgeInsetsDirectional.only(start: 35, top: 15),
                child: AppText.medium(
                    text: 'permissions',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),

             //TODO GridView
              GridView.builder(
                shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 6 / 2,
                      crossAxisSpacing: 0,
                      mainAxisSpacing: 20),
                  itemCount: 20,
                  itemBuilder: (BuildContext ctx, index) {
                    return Container(
                      margin: const EdgeInsetsDirectional.only(
                          start: 16, end: 16, top: 16),
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12).r,
                        color: AppColors.lightGray6,
                      ),
                      child: Row(
                        children: [
                          //
                          Container(
                            margin: const EdgeInsetsDirectional.only(start: 8),
                            alignment: AlignmentDirectional.center,
                            width: 24.w,
                            height: 24.h,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15).r),
                          ),

                          Container(
                            margin: const EdgeInsetsDirectional.only(start: 12),
                            child: AppText.medium(
                                text: 'Entertainment',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: AppColors.colorDark),
                          ),
                        ],
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

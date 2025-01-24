import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5,
              child: Image.asset('assets/images/ball_up.png'),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: Image.asset('assets/images/ball_down.png'),
            ),
          ),
          SafeArea(
              child: Padding(
                padding: EdgeInsets.all(16.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CupertinoButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          padding: EdgeInsets.zero,
                          child: Container(
                            width: 52.w,
                            height: 52.w,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/left_arrow.svg'),
                            ),
                          ),
                        ),
                        Text('About Us', style: AppStyles.exoW500Black(24.sp),),
                        CupertinoButton(
                          onPressed: () {},
                          padding: EdgeInsets.zero,
                          child: Container(
                            width: 52.w,
                            height: 52.w,
                            padding: EdgeInsets.all(16.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.white
                            ),
                            child: Center(
                              child: SvgPicture.asset('assets/icons/message.svg'),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.w,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.r),
                        color: AppColors.white
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Welcome to Turb!', style: AppStyles.quicksandW600Black(24.sp),),
                          SizedBox(height: 16.w,),
                          Text('Discover the ultimate football app designed for fans who want to explore and connect with clubs. Our app allows you to easily search for and find your favorite teams, providing in-depth information about their history, players, and recent performances. Stay updated with the latest news, match results, and upcoming fixtures all in one place. Engage with a vibrant community of football enthusiasts, share your thoughts, and discuss matches with fellow fans. Whether you\'re looking to follow a local club or keep up with international teams, our user-friendly interface makes it simple and enjoyable. Join us in celebrating the beautiful game and take your football experience to the next level!',
                          style: AppStyles.quicksandW500Black(16.sp),),
                          SizedBox(height: 16.w,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: Container(
                                    height: 54.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(34.r),
                                      color: AppColors.white
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/terms_of_use.svg'),
                                        SizedBox(width: 8.w,),
                                        Text('Terms of Use', style: AppStyles.nunitoW600Black(18.sp),)
                                      ],
                                    ),
                                  )
                              ),
                              CupertinoButton(
                                  padding: EdgeInsets.zero,
                                  onPressed: () {},
                                  child: Container(
                                    height: 54.w,
                                    padding: EdgeInsets.all(8.w),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(34.r),
                                        color: AppColors.white
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset('assets/icons/privacy_policy.svg'),
                                        SizedBox(width: 8.w,),
                                        Text('Privacy Policy', style: AppStyles.nunitoW600Black(18.sp),)
                                      ],
                                    ),
                                  )
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}

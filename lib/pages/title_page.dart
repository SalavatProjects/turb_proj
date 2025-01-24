import 'package:blur/blur.dart';
import 'package:chaturbate/ui_kit/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_kit/app_colors.dart';

class TitlePage extends StatelessWidget {
  String imagePath;
  String title;
  String text;

  TitlePage({
    super.key,
    required this.imagePath,
    required this.title,
    required this.text,
  });

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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 212.w,
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(32.r),
                          image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: CupertinoButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            padding: EdgeInsets.zero,
                            child: Blur(
                              borderRadius: BorderRadius.circular(26.r),
                              blurColor: AppColors.darkGrey,
                              overlay: Center(
                                child: SvgPicture.asset(
                                  'assets/icons/left_arrow.svg',
                                  colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),),
                              ),
                              child:
                              Container(
                                width: 52.w,
                                height: 52.w,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16.w,),
                      Text(title, style: AppStyles.exoW500Black(20.sp),),
                      SizedBox(height: 16.w,),
                      Text(text, style: AppStyles.exoW500Black(16.sp),),
                    ],
                  ),
                ),
              )
          )
        ],
      ),
    );
  }
}

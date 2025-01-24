import 'package:blur/blur.dart';
import 'package:chaturbate/pages/titles_page.dart';
import 'package:chaturbate/ui_kit/app_styles.dart';
import 'package:chaturbate/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_kit/app_colors.dart';

class FootballInfoPage extends StatelessWidget {
  const FootballInfoPage({super.key});

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
          SafeArea(child:
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
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
                    SizedBox(width: 50.w,),
                    Text('Football Info', style: AppStyles.exoW500Black(24.sp),)
                  ],
                ),
                SizedBox(height: 16.w,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _FootballCard(
                            imagePath: 'assets/images/latest_news.png',
                            text: 'Latest news',
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (BuildContext context) => TitlesPage(data: AppConstants.latestNews))
                              );
                            }),
                        _FootballCard(
                            imagePath: 'assets/images/american_soccer.png',
                            text: 'American soccer',
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TitlesPage(data: AppConstants.americanSoccer))
                              );
                            }),
                        _FootballCard(
                            imagePath: 'assets/images/classic_soccer.png',
                            text: 'Classic soccer',
                            onPressed: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (BuildContext context) => TitlesPage(data: AppConstants.classicSoccer))
                              );
                            }),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class _FootballCard extends StatelessWidget {
  String imagePath;
  String text;
  void Function() onPressed;

  _FootballCard({
    super.key,
    required this.imagePath,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.w),
      child: CupertinoButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 180.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28.r),
              image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover)
          ),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Blur(
                    borderRadius: BorderRadius.circular(26.r),
                    blurColor: AppColors.darkGrey,
                    overlay: Center(
                      child: SvgPicture.asset('assets/icons/right_up_arrow.svg'),
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Blur(
                  blurColor: AppColors.darkGrey,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(28.r),
                      bottomRight: Radius.circular(28.r)
                  ),
                  overlay: Center(
                    child: Text(
                      text,
                      style: AppStyles.exoW500White(20.sp),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 46.w,
                  ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:chaturbate/pages/about_us_page.dart';
import 'package:chaturbate/pages/clubs_page.dart';
import 'package:chaturbate/pages/football_info_page.dart';
import 'package:chaturbate/pages/search_team_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chaturbate/ui_kit/app_colors.dart';
import 'package:chaturbate/ui_kit/app_styles.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.75,
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/images/main_background.png'), fit: BoxFit.fitHeight)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.6,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 32.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(42.r), topRight: Radius.circular(42.r)),
                color: AppColors.white
              ),
              child: Column(
                children: [
                  Text('Welcome to Turb!',style: AppStyles.exoW700Black(16.sp),),
                  SizedBox(height: 16.w,),
                  Text('Get ready to dive into the world of football with Turb!',
                    style: AppStyles.exoW700Black(20.sp),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8.w,),
                  Text('Easily find clubs, track your favorite teams, and stay updated on scores and news. Let’s kick off your football journey!',
                  style: AppStyles.exoW500Black(14.sp),
                  textAlign: TextAlign.center,),
                  SizedBox(height: 40.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _MainPageBtn(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) => ClubsPage())
                            );
                          },
                          iconPath: 'assets/icons/clubs.svg',
                          text: 'Clubs'),
                      _MainPageBtn(
                          onPressed: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (BuildContext context) => FootballInfoPage())
                            );
                          },
                          iconPath: 'assets/icons/football_info.svg',
                          text: 'Football Info'),
                    ],
                  ),
                  SizedBox(height: 16.w,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _MainPageBtn(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) => SearchTeamPage())
                            );
                          },
                          iconPath: 'assets/icons/search_team.svg',
                          text: 'Search Team'),
                      _MainPageBtn(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (BuildContext context) => AboutUsPage())
                            );
                          },
                          iconPath: 'assets/icons/about_us.svg',
                          text: 'About Us'),
                    ],
                  ),
                  Spacer(),
                  CupertinoButton(
                    padding: EdgeInsets.zero,
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 54.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(27.r),
                          border: Border.all(width: 1, color: AppColors.red)
                        ),
                        child: Center(
                          child: Text('Exit', style: AppStyles.nunitoW600Black(18.sp),),
                        ),
                      )
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _MainPageBtn extends StatelessWidget {
  void Function() onPressed;
  String iconPath;
  String text;

  _MainPageBtn({
    super.key,
    required this.onPressed,
    required this.iconPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        child: Container(
          width: 158.w,
          height: 54.w,
          padding: EdgeInsets.symmetric(vertical: 16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(34.r),
            color: AppColors.primary,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(iconPath),
              SizedBox(width: 8.w,),
              Text(text, style: AppStyles.exoW600White(18.sp),)
            ],
          ),
        )
    );
  }
}

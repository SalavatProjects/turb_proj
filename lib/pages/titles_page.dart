import 'package:blur/blur.dart';
import 'package:chaturbate/pages/title_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class TitlesPage extends StatelessWidget {
  List<(String name, String imagePath, String title)> data;

  TitlesPage({
    super.key,
    required this.data
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
          SafeArea(child:
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                SizedBox(height: 16.w,),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                          data.length,
                              (int index) => Padding(
                                padding: EdgeInsets.symmetric(vertical: 8.w),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 252.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(32.r),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      CupertinoButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    TitlePage(
                                                        imagePath: data[index].$2,
                                                        title: data[index].$1,
                                                        text: data[index].$3))
                                          );
                                        },
                                        padding: EdgeInsets.zero,
                                        child: Container(
                                          width: MediaQuery.of(context).size.width,
                                          height: 180.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(topLeft: Radius.circular(32.r), topRight: Radius.circular(32.r)),
                                              image: DecorationImage(image: AssetImage(data[index].$2), fit: BoxFit.fitWidth)
                                          ),
                                          child: Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.w),
                                                  child: CupertinoButton(
                                                    onPressed: () {
                                                    },
                                                    padding: EdgeInsets.zero,
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
                                              ),
                                              Align(
                                                alignment: Alignment.bottomCenter,
                                                child: Blur(
                                                  blurColor: AppColors.darkGrey,
                                                  overlay: Center(
                                                    child: Text(
                                                      data[index].$1,
                                                      style: AppStyles.exoW500White(20.sp),
                                                      textAlign: TextAlign.center,
                                                    ),
                                                  ),
                                                  child: SizedBox(
                                                    width: MediaQuery.of(context).size.width,
                                                    height: 46.w,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(vertical: 16.w, horizontal: 12.w),
                                        child: Text(
                                          data[index].$3,
                                          style: AppStyles.quicksandW500Black(16.sp),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                      ),
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

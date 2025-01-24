import 'package:chaturbate/pages/main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../ui_kit/app_colors.dart';
import '../ui_kit/app_styles.dart';

class SearchTeamPage extends StatefulWidget {
  const SearchTeamPage({super.key});

  @override
  State<SearchTeamPage> createState() => _SearchTeamPageState();
}

class _SearchTeamPageState extends State<SearchTeamPage> {
  TextEditingController _nameTextEditingController = TextEditingController();
  TextEditingController _phoneTextEditingController = TextEditingController();
  TextEditingController _emailTextEditingController = TextEditingController();
  TextEditingController _bioTextEditingController = TextEditingController();

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
                        Text('Search Team', style: AppStyles.exoW500Black(24.sp),)
                      ],
                    ),
                    SizedBox(height: 20.w,),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: 141.w,
                              height: 141.w,
                              child: Stack(
                                children: [
                                  Container(
                                    width: 141.w,
                                    height: 141.w,
                                    padding: EdgeInsets.all(36.w),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(width: 1, color: AppColors.grey)
                                    ),
                                    child: Center(
                                        child: SvgPicture.asset('assets/icons/person.svg')),
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                      width: 38.w,
                                      height: 38.w,
                                      padding: EdgeInsets.all(10.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: AppColors.white,
                                      ),
                                      child: Center(
                                        child: SvgPicture.asset('assets/icons/plus.svg'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(height: 24.w,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name', style: AppStyles.exoW500Black(16.sp),),
                                SizedBox(height: 8.w,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 54.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(27.r),
                                    border: Border.all(width: 1, color: AppColors.lightGrey)
                                  ),
                                  padding: EdgeInsets.fromLTRB(28.w, 17.w, 0, 0),
                                  child: TextFormField(
                                    controller: _nameTextEditingController,
                                    style: AppStyles.exoW500Black(16.sp),
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                      contentPadding: EdgeInsets.zero,
                                      isDense: true,
                                      hintText: 'Mark',
                                      hintStyle: AppStyles.exoW500DarkGrey(16.sp)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.w,),
                                Text('Phone number', style: AppStyles.exoW500Black(16.sp),),
                                SizedBox(height: 8.w,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 54.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      border: Border.all(width: 1, color: AppColors.lightGrey)
                                  ),
                                  padding: EdgeInsets.fromLTRB(28.w, 17.w, 0, 0),
                                  child: TextFormField(
                                    controller: _nameTextEditingController,
                                    style: AppStyles.exoW500Black(16.sp),
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        hintText: '+38 012 456 7654',
                                        hintStyle: AppStyles.exoW500DarkGrey(16.sp)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.w,),
                                Text('Email', style: AppStyles.exoW500Black(16.sp),),
                                SizedBox(height: 8.w,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 54.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      border: Border.all(width: 1, color: AppColors.lightGrey)
                                  ),
                                  padding: EdgeInsets.fromLTRB(28.w, 17.w, 0, 0),
                                  child: TextFormField(
                                    controller: _emailTextEditingController,
                                    style: AppStyles.exoW500Black(16.sp),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        hintText: 'Add email',
                                        hintStyle: AppStyles.exoW500DarkGrey(16.sp)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.w,),
                                Text('Bio', style: AppStyles.exoW500Black(16.sp),),
                                SizedBox(height: 8.w,),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: 54.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(27.r),
                                      border: Border.all(width: 1, color: AppColors.lightGrey)
                                  ),
                                  padding: EdgeInsets.fromLTRB(28.w, 17.w, 0, 0),
                                  child: TextFormField(
                                    controller: _bioTextEditingController,
                                    style: AppStyles.exoW500Black(16.sp),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        contentPadding: EdgeInsets.zero,
                                        isDense: true,
                                        hintText: 'Add Bio...',
                                        hintStyle: AppStyles.exoW500DarkGrey(16.sp)
                                    ),
                                  ),
                                ),
                                SizedBox(height: 32.w,),
                                CupertinoButton(
                                  padding: EdgeInsets.zero,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(builder: (BuildContext context) => MainPage())
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 54.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(27.r),
                                        color: AppColors.primary
                                      ),
                                      child: Center(
                                        child: Text('Find a Team', style: AppStyles.nunitoW600White(16.sp),
                                        ),
                                      ),
                                    )
                                )
                              ],
                            )
                          ],
                        ),
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

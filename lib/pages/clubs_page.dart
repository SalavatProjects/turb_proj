import 'package:chaturbate/ui_kit/app_colors.dart';
import 'package:chaturbate/ui_kit/app_styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:blur/blur.dart';
import 'package:url_launcher/url_launcher.dart';

class ClubsPage extends StatelessWidget {
  ClubsPage({super.key});


  Future<List<Map<String, String>>> _fetchData() async {
    final Dio dio = Dio();
    List<Map<String, String>> clubs = [];
    dio.options.headers = {
      'Accept' : 'application/json',
      'Authorization' : 'fsq32JnDWaluKSLu63g33l+hxsSj9dN53P8hP16qRpOdX0I='
    };
    final response = await dio.get('https://api.foursquare.com/v3/places/search?query=soccer&limit=50&categories=18062');
    List results = response.data['results'];

    for (int i = 0; i < results.length; i++) {
      try {
        final imageResponse = await dio.get('https://api.foursquare.com/v3/places/${results[i]['fsq_id']}/photos');
        clubs.add({
          'name' : results[i]['name'],
          'imagePath' : '${imageResponse.data[0]['prefix']}original${imageResponse.data[0]['suffix']}',
          'latitude' : results[i]['geocodes']['main']['latitude'].toString(),
          'longitude' : results[i]['geocodes']['main']['longitude'].toString(),
        });
        // print(clubs[i]);
      } catch (e) {
        // print(e);
      }

    }
    return clubs;
  }

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
                            child: SvgPicture.asset('assets/icons/search.svg'),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                      future: _fetchData(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List clubs = snapshot.data as List;
                          return Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                children: List.generate(clubs.length,
                                        (int index) {
                                        // print(clubs[index]);
                                          return Padding(
                                            padding: EdgeInsets.symmetric(vertical: 8.w),
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              height: 203.w,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(28.r),
                                                  image: DecorationImage(image: NetworkImage(clubs[index]['imagePath']), fit: BoxFit.cover)
                                              ),
                                              child: Stack(
                                                children: [
                                                  Align(
                                                    alignment: Alignment.topRight,
                                                    child: Padding(
                                                        padding: EdgeInsets.all(8.w),
                                                      child: CupertinoButton(
                                                        onPressed: () async {
                                                          if (await launchUrl(Uri.parse('https://www.google.com/maps?q=${clubs[index]['latitude']},${clubs[index]['longitude']}'))) {
                                                            throw Exception('could not launch url');
                                                          }
                                                        },
                                                        padding: EdgeInsets.zero,
                                                        child: Blur(
                                                          borderRadius: BorderRadius.circular(26.r),
                                                          overlay: Center(
                                                            child: SvgPicture.asset('assets/icons/location.svg'),
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
                                                      borderRadius: BorderRadius.only(
                                                          bottomLeft: Radius.circular(28.r),
                                                          bottomRight: Radius.circular(28.r)
                                                      ),
                                                    overlay: Center(
                                                      child: Text(
                                                        clubs[index]['name'],
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
                                          );
                                        }

                                ),
                              ),
                            ),
                          );
                        } else {
                          return Expanded(
                            child: Center(
                              child: SizedBox(
                                width: 60.w,
                                height: 60.w,
                                child: SpinKitDoubleBounce(
                                  color: AppColors.darkGrey,
                                ),
                              ),),
                          );
                        }
                      })
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

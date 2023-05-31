import 'package:conforc_test/utils/colors.dart';
import 'package:conforc_test/widgets/big_text.dart';
import 'package:conforc_test/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class PopularCard extends StatelessWidget {
  final String courseName;
  const PopularCard({Key? key, required this.courseName}) : super(key: key);

  @override
  Widget build(BuildContext context) {



    var logo = [  "assets/live_class.svg",
      "assets/exam.svg",
      "assets/recreded.svg",
      "assets/note.svg"];
    var name = [
      "Live classes",
      "Weekly exams",
      "Recorded videos",
      "Study notes"
    ];
    var number = ["25", "40", "40", "0"];

    return Container(
      height:160.h,
      width: MediaQuery.of(context).size.width ,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/popular.png"),
              alignment: Alignment.bottomRight),
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: cardBorderColor)),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 16.0.h, bottom: 12.h),
            child: Row(
              children: [
                BigText(
                  text: courseName,
                  color: darkBlueColor,
                  size: 14.sp,
                ),
                SizedBox(
                  width: 12.w,
                ),

                Text(
                  "\$9.99",
                  style: TextStyle(
                      fontFamily: "Satoshi Light", color: darkBlueColor),
                ),
              ],
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Wrap(
                  spacing: 10,
                  runSpacing: 3,
                  direction: Axis.horizontal,
                  children: List.generate(name.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Container(
                        // height: 30,
                        padding: EdgeInsets.all(10.w),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50.r),
                            color: tabContainerColor),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Center(child: SvgPicture.asset(logo[index])),
                            SizedBox(width: 6.w,),
                            Center(
                              child: Visibility(
                                  visible: index % 2 == 0 ? true : false,
                                  child: BigText(
                                    text: number[index],
                                    size: 11.sp,
                                    color: darkBlueColor,
                                  )),
                            ),
                            SizedBox (width: 6.w,),

                            Center(
                              child: SmallText(
                                text: name[index],
                                color: darkBlueColor,
                                size: 11.sp,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                ),


                // GridView.builder(
                //   physics: NeverScrollableScrollPhysics(),
                //   // padding: EdgeInsets.zero,
                //   shrinkWrap: true,
                //   gridDelegate:
                //       SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2.9,mainAxisSpacing: 10, crossAxisSpacing: 10 ),
                //   itemBuilder: (_, index) {
                //     return
                //   },
                //   itemCount: 4,
                // ),
              ),
              SizedBox(width: 5.w,),
              Container(
                padding: EdgeInsets.all(20.r),
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkBlueColor
                ),
                child: SvgPicture.asset("assets/play.svg"),

              )
            ],
          )
        ],
      ),
    );
  }
}

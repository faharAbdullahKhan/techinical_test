import 'package:conforc_test/utils/colors.dart';
import 'package:conforc_test/widgets/big_text.dart';
import 'package:conforc_test/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final TextEditingController _searchTextController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(170.h),
        child: AppBar(
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30.r),
            ),
          ),
          backgroundColor: blueColor,
          leading: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Container(
              // padding: EdgeInsets.all(10),
              decoration: const BoxDecoration(shape: BoxShape.circle, color: drawerContainerColor),
              child: SvgPicture.asset("assets/drawer.svg"),
            ),
          ),
          actions: [
            Padding(
              padding:  EdgeInsets.only(right: 16.0.w, top: 5.h, bottom: 5.h),
              child: SizedBox(
                width: 211.w,
                child: TextField(
                  controller: _searchTextController,
                  decoration: InputDecoration(
                    hintStyle:  TextStyle(
                      height: 2.8,
                        color: Colors.white, fontSize: 16.sp, fontFamily: 'Satoshi Light', fontWeight: FontWeight.normal),
                    fillColor: drawerContainerColor,
                    filled: true,
                    hintText: "Search here",
                    suffixIcon: SvgPicture.asset("assets/search.svg",height: 30,),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80.r),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80.r),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(80.r),
                      borderSide: const BorderSide(
                        width: 0.5,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: Row(
                children: [
                   SizedBox(width: 16.w,),
                   SizedBox(
                    height: 75.h,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BigText(text: "Good Morning, Qubo!",color: Colors.white,size: 20.sp,),
                        SmallText(text: "Be educated so that you can change the world.",size: 14.sp,color: Colors.white)
                      ],
                    ),
                  ),
                ],
              )
          ),
        ),
      ),
    );
  }
}

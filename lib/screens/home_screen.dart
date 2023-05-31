import 'package:conforc_test/utils/colors.dart';
import 'package:conforc_test/widgets/big_text.dart';
import 'package:conforc_test/widgets/onsale_card_widget.dart';
import 'package:conforc_test/widgets/popular_card.dart';
import 'package:conforc_test/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _searchTextController = TextEditingController();
  late TabController _tabController;
  List<String> items = ["All", "Design", "Communication", "Development"];
  int current = 0;

  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // extendBodyBehindAppBar: true,
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
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: drawerContainerColor),
                child: SvgPicture.asset("assets/drawer.svg"),
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 16.0.w, top: 5.h, bottom: 5.h),
                child: SizedBox(
                  width: 211.w,
                  child: TextField(
                    controller: _searchTextController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(
                          height: 2.8,
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontFamily: 'Satoshi Light',
                          fontWeight: FontWeight.normal),
                      fillColor: drawerContainerColor,
                      filled: true,
                      hintText: "Search here",
                      suffixIcon: SvgPicture.asset(
                        "assets/search.svg",
                        height: 30,
                      ),
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
                    SizedBox(
                      width: 16.w,
                    ),
                    SizedBox(
                      height: 75.h,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          BigText(
                            text: "Good Morning, Qubo!",
                            color: Colors.white,
                            size: 20.sp,
                          ),
                          SmallText(
                              text:
                                  "Be educated so that you can change the world.",
                              size: 14.sp,
                              color: Colors.white)
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.all(5),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (ctx, index) {
                      return Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                current = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.all(5),
                              // width: 100,
                              height: 45,
                              decoration: BoxDecoration(
                                color: current == index
                                    ? blueColor
                                    : tabContainerColor,
                                borderRadius: current == index
                                    ? BorderRadius.circular(30)
                                    : BorderRadius.circular(30),
                                border: current == index
                                    ? Border.all(
                                    color: Colors.deepPurpleAccent, width: 2)
                                    : null,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal:20.0),
                                child: Center(
                                  child: SmallText(
                                    text:items[index],
                                      size: 14.sp,
                                      color: current == index
                                          ? Colors.white
                                          : darkBlueColor),

                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
              ),

              Expanded(
                child: Container(
                  // margin: const EdgeInsets.only(top: ),
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "ON SALE", size: 11.sp,color: darkBlueColor,),
                            SmallText(text: "View all", color: blueColor,size: 11.sp,)
                          ],
                        ),
                        SizedBox(height: 16.h,),
                        SizedBox(
                          height: 160.h,
                          width: MediaQuery.of(context).size.width,
                          child: ListView.builder(

                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (_, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: OnSaleCard(),
                              );
                            },
                            itemCount: 4,
                          ),
                        ),
                        SizedBox(height: 24.h,),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BigText(text: "Popular Courses", size: 11.sp,color: darkBlueColor,),
                          ],
                        ),
                        SizedBox(height: 16.h,),

                        PopularCard(courseName: 'Product Design',),
                        SizedBox(height: 12.h,),

                        PopularCard(courseName: 'Project Management',),



                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),);
  }
}

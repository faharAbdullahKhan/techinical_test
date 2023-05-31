import 'package:conforc_test/screens/home_screen.dart';
import 'package:conforc_test/utils/colors.dart';
import 'package:conforc_test/widgets/small_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  late PageController pageController;
  int _page = 0;
  int currentIndex = 0;
  List<String> imagePath = ["assets/home.svg", "assets/saved.svg","assets/course.svg","assets/library.svg" ];
  List<String> bottomNavigation = ["Home", "Saved","Course","Library" ];




  var mainScreenItems = [
    const  HomeScreen(),
    // AddPostScreen(),
    const  HomeScreen(),
    const  HomeScreen(),
    const HomeScreen()
  ];


  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    // this will act as a link between tab bar and the pageView widget in the scaffold body.
    pageController.jumpToPage(page);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: onPageChanged,
        children: mainScreenItems,
      ),
      bottomNavigationBar: Container(
        // width: 3.w,
          height: 90.h,
          // color: themeValue == 1 ? darkThemeBackgroundColor: Colors.white,
          child: Container(
            margin: const EdgeInsets.all(10).w,
            padding: EdgeInsets.all(20),

            decoration: BoxDecoration(
                // color: themeValue == 1 ? darkThemeBottomNavigationBarColor: Colors.white,
                // border: Border.all(color: greyColor),
              color: blueColor,
                borderRadius: BorderRadius.circular(50).r
            ),
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index){
                  return InkWell(
                    // splashColor: orangeColor,
                    highlightColor: blueColor,

                    onTap: (){
                      setState(() {
                        currentIndex = index;
                        navigationTapped(index);

                      });
                    },

                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0.w),
                      child: Column(
                        children: [
                          SvgPicture.asset(imagePath[index], color: currentIndex == index ? Colors.white : Color(0xFFccc7c5),),
                          SmallText(text: bottomNavigation[index],color: currentIndex == index ? Colors.white : Color(0xFFccc7c5),)
                        ],
                      ),
                    ),


                  );
                }),
          )


        // CupertinoTabBar(
        //   backgroundColor: Colors.white,
        //   items: [
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/gep.png", width: 30,),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/location.png"),
        //         ),
        //         backgroundColor: Colors.white),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/cart.png"),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/fav.png"),
        //         ),
        //         ),
        //     BottomNavigationBarItem(
        //         icon: Padding(
        //           padding: const EdgeInsets.only(top: 10.0),
        //           child: Image.asset("assets/notification.png"),
        //         ),
        //        ),
        //   ],
        //   onTap: navigationTapped,
        // ),
      ),
    );
  }
}

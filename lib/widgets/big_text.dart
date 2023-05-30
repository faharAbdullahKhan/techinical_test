import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;

  BigText(
      {Key? key,
        this.color = const Color(0xFF332b2b),
        required this.text,
        this.overflow = TextOverflow.ellipsis,
        this.fontWeight = FontWeight.normal,
        this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 10,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontWeight: fontWeight,
        fontSize: size == 0 ? 20.sp : size,
        fontFamily: 'Satoshi Variable',
      ),


    );
  }
}

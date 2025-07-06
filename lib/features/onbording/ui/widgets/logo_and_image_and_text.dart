import 'package:doctor_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAndImageAndText extends StatelessWidget {
  const LogoAndImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset('assets/svgs/doc_logo_low_opacity.svg'),
        Container(
          foregroundDecoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white.withOpacity(0.0)
              ],
              stops: [
                0.14,
                0.4
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Image.asset('assets/images/onbording_image.png'),
        ),
        Positioned(
          bottom: 30.h,
          right: 0,
          left: 0,
          child: Text(
            textAlign: TextAlign.center,
            'Best Doctor\nAppointment App',
            style: TextStyles.font32BlueBold.copyWith(height: 1.4),
          ),
        ),
      ],
    );
  }
}

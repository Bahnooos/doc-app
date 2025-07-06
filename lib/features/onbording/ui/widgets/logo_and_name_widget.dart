import 'package:doctor_app/core/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoAndNameWidget extends StatelessWidget {
  const LogoAndNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/doc_logo.svg'),
        SizedBox(
          width: 10.w,
        ),
        Text(
          'DocDoc',
          style: TextStyles.font24BlackBold,
        ),
      ],
    );
  }
}

import 'package:doctor_app/core/theme/styles.dart';
import 'package:doctor_app/features/onbording/ui/widgets/get_start_button.dart';
import 'package:doctor_app/features/onbording/ui/widgets/logo_and_image_and_text.dart';
import 'package:doctor_app/features/onbording/ui/widgets/logo_and_name_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnbordingScreenBody extends StatelessWidget {
  const OnbordingScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.0.h),
        child: Column(
          children: [
            LogoAndNameWidget(),
            SizedBox(
              height: 30.h,
            ),
            LogoAndImageAndText(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  Text(
                    textAlign: TextAlign.center,
                    'Manage and schedule all of your medical appointments easily  with Docdoc to get a new experience.',
                    style: TextStyles.font13GrayRegular,
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  GetStartButton()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

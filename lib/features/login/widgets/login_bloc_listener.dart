import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/routing/routes.dart';
import 'package:doctor_app/core/theme/colors_manager.dart';
import 'package:doctor_app/core/theme/styles.dart';
import 'package:doctor_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctor_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) => current is Loading || current is Failure || current is Success,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        }, success: (data) {
          context.pop();
          context.pushNamed(Routes.homeScreen);
        }, failure: (error) {
          setupErrorState(context, error);
        });
      },
      child: SizedBox.shrink(),
    );
  }

  void setupErrorState(BuildContext context, String error) {
    context.pop();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        icon: const Icon(
          Icons.error,
          color: Colors.red,
          size: 32,
        ),
        content: Text(
          error,
          style: TextStyles.font15DarkBlueMedium,
        ),
        actions: [
          TextButton(
            onPressed: () {
              context.pop();
            },
            child: Text(
              'Got it',
              style: TextStyles.font14BlueSemiBold,
            ),
          ),
        ],
      ),
    );
  }
}

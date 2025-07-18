import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:doctor_app/features/signup/data/repos/sign_up_repo.dart';
import 'package:doctor_app/features/signup/logic/cubit/sign_up_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(SignUpState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> emitSignupStates() async {
    emit(SignUpState.loading());

    final response = await _signUpRepo.signUp(
      signUpRequestBody: SignupRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0,
      ),
    );
    response.when(
      success: (data) => emit(
        SignUpState.success(data),
      ),
      failure: (failure) => emit(
        SignUpState.error(failure.apiErrorModel.message ?? ''),
      ),
    );
  }
}

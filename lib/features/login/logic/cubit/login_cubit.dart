import 'package:doctor_app/core/helpers/constants.dart';
import 'package:doctor_app/core/helpers/shared_pref_helper.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/dio_factory.dart';
import 'package:doctor_app/features/login/data/models/login_request_body.dart';
import 'package:doctor_app/features/login/data/repos/login_repo.dart';
import 'package:doctor_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(LoginState.initial());
  final formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void emitLoginStates() async {
    emit(const LoginState.loading());
    final response = await _loginRepo.login(
      LoginRequestBody(
        email: emailController.text,
        password: passwordController.text,
      ),
    );
    response.when(
        success: (data) async {
          await saveUserToken(data.userData?.token);
          emit(LoginState.success(data));
        },
        failure: (failure) => emit(
              LoginState.failure(
                 failure,
              ),
            ));
  }

  Future<void> saveUserToken(String? token) async {
    SharedPrefHelper.setSecureData(key: Constants.userToken, value: token ??'');
    DioFactory.sendTokenAfterLoggedIn(token);
  }
}

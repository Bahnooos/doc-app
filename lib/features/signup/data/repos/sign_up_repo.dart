import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/core/networking/api_service.dart';
import 'package:doctor_app/features/signup/data/models/sign_up_request_body.dart';
import 'package:doctor_app/features/signup/data/models/sign_up_response.dart';

class SignUpRepo {
  final ApiService _apiService;
  SignUpRepo(this._apiService);

  Future<ApiResult<SignupResponse>> signUp({required SignupRequestBody signUpRequestBody}) async {
    try {
      final response = await _apiService.signUp(signUpRequestBody);
      return ApiResult.success(response);
    } catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}

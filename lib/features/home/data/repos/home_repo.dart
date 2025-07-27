import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/home/data/apis/home_api_services.dart';
import 'package:doctor_app/features/home/data/models/specializations_response_model.dart';

class HomeRepo {
  final HomeApiServices _homeApiServices;

  HomeRepo(this._homeApiServices);
  Future<ApiResult<SpecializationsResponseModel>>
      getSpecializationsDoctors() async {
    try {
      final response = await _homeApiServices.getSpecializationDoctors();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

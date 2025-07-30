import 'package:doctor_app/core/helpers/extensions.dart';
import 'package:doctor_app/core/networking/api_error_handler.dart';
import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/home/data/models/specializations_response_model.dart';
import 'package:doctor_app/features/home/data/repos/home_repo.dart';
import 'package:doctor_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  List<SpecializationsData?>? specializationsDataList = [];

  void getSpecialization() async {
    emit(HomeState.loading());
    final response = await _homeRepo.getSpecializationsDoctors();
    response.when(success: (specialization) {
      specializationsDataList = specialization.specializationDataList;
      getFilterDoctorsById(specializationId: specializationsDataList?.first?.id ?? 1);
      emit(HomeState.specializationsSuccess(specializationsDataList));
    }, failure: (failure) {
      emit(HomeState.specializationsError(failure));
    });
  }

  void getFilterDoctorsById({required int? specializationId}) {
    final doctors = getDoctorsListBySpecializationId(specializationId);
    if (!doctors.isNullAndEmpty()) {
      emit(HomeState.doctorsSuccess(doctors));
    } else {
      emit(HomeState.doctorsError(ApiErrorHandler.handle('error')));
    }
  }


  List<Doctors?>? getDoctorsListBySpecializationId(index) {
    return specializationsDataList
        ?.firstWhere((specializationId) => specializationId?.id == index)
        ?.doctorsList;
  }
}

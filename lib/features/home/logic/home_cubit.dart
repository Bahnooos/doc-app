import 'package:doctor_app/core/networking/api_result.dart';
import 'package:doctor_app/features/home/data/repos/home_repo.dart';
import 'package:doctor_app/features/home/logic/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void getSpecialization() async {
    emit(HomeState.loading());
    final response = await _homeRepo.getSpecializationsDoctors();
    response.when(success: (specialization) {
      emit(HomeState.specializationsSuccess(specialization));
    }, failure: (failure) {
      emit(HomeState.specializationsError(failure));
    });
  }
}

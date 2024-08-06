import 'package:chanzel_app/bannerModel.dart';
import 'package:chanzel_app/helper/apiConst.dart';
import 'package:chanzel_app/helper/apiHelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cubit_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  BannerModel bannerModel = BannerModel();

  void getbanners() async {
    emit(HomeBannerLoading());
    try {
      final response = await ApiHelper.instance.get(
        ApiConst.BANNER,
      );
      bannerModel = BannerModel.fromJson(response.data);
      if (bannerModel.status == true) {
        emit(HomeBannerSuccess());
      } else {
        emit(HomeBannerError());
      }
    } catch (e) {
      emit(HomeBannerError());
    }
  }
}
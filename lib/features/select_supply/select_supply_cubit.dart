import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/views/pages/home_view.dart';

part 'select_supply_states.dart';

class SelectSupplyCubit extends Cubit<SelectSupplyStates> {
  SelectSupplyCubit() : super(SelectSupplyStates());

  static SelectSupplyCubit get(BuildContext context) =>
      BlocProvider.of(context);
  bool isSupp1 = true;

  void toSupp1() {
    isSupp1 = true;
    emit(SelectSupplySupp1State());
  }

  void toSupp2() {
    isSupp1 = false;
    emit(SelectSupplySupp2State());
  }

  Future<void> selectSupply({required String supid}) async {
    emit(SelectSupplyLoadState());
    final response =
        await DioHelper.sendData(endPoint: changeConfigration, data: {
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
      "supid": supid,
    });

    if (response.isSuccess) {
      showMessage(message: "Login Successfull", type: MessageType.success);
      navigateTo(toPage: const HomePage(), dontRemove: false);
      emit(SelectSupplySuccessState());
    } else {
      emit(SelectSupplyFailedState());
      showMessage(message: 'Selected failed');
      Navigator.pop(navigatorKey.currentContext!);
    }
  }
}

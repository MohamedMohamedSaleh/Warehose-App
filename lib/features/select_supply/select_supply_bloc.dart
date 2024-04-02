import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/views/pages/account/screens/settings_view.dart';
import 'package:warehouse/views/pages/home_view.dart';

part 'select_supply_events.dart';
part 'select_supply_states.dart';

class SelectSupplyBloc extends Bloc<SelectSupplyEvents, SelectSupplyStates> {
  SelectSupplyBloc() : super(SelectSupplyStates()) {
    on<SelectSupp1Event>(_toSupp1);
    on<SelectSupp2Event>(_toSupp2);
    on<SelectSupplyEvent>(_selectSupply);
  }

  static SelectSupplyBloc get(BuildContext context) => BlocProvider.of(context);
  bool isSupp1 =
      (CacheHelper.getSupply() == null) ? true : CacheHelper.getSupply() == '1';

  void _toSupp1(SelectSupp1Event event, Emitter<SelectSupplyStates> emit) {
    isSupp1 = true;
    emit(SelectSupplySupp1State());
  }

  void _toSupp2(SelectSupp2Event event, Emitter<SelectSupplyStates> emit) {
    isSupp1 = false;
    emit(SelectSupplySupp2State());
  }
// {required String supid, bool isLogin = true}
  Future<void> _selectSupply(
    SelectSupplyEvent event, Emitter<SelectSupplyStates> emit
      ) async {
    emit(SelectSupplyLoadState());
    final response =
        await DioHelper.sendData(endPoint: EndPoint.changeConfigration, data: {
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
      "supid": event.supid,
    });

    if (response.isSuccess) {
      CacheHelper.setSupply(supply: event.supid);
      if (event.isLogin) {
        showMessage(message: "Login Successfull", type: MessageType.success);
        navigateTo(toPage: const HomePage(), dontRemove: false);
      } else {
        showMessage(
            message: "Save Change Successfull", type: MessageType.success);
        Navigator.pop(navigatorKey.currentContext!);
        Navigator.pop(navigatorKey.currentContext!);
        navigateTo(toPage: const SettingsPage());
      }
      emit(SelectSupplySuccessState());
    } else {
      emit(SelectSupplyFailedState());
      showMessage(message: 'Selected failed');
      Navigator.pop(navigatorKey.currentContext!);
    }
  }
}

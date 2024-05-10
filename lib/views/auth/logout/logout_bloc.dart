import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/views/auth/login/login_view.dart';

import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_mothods.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvents, LogoutStates> {
  LogoutBloc() : super(LogoutInitial()) {
    on<LogoutEvent>(_logOut);
  }

  Future<void> _logOut(LogoutEvent event, Emitter<LogoutStates> emit) async {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();

    emit(LogoutLoading());
    var response = await DioHelper.sendData(
      endPoint: EndPoint.logOut,
      data: {
        'userid': CacheHelper.getUserId(),
        'token': CacheHelper.getUserToken(),
      },
    );

    if (response.isSuccess) {
      emit(LogoutSuccess());
      CacheHelper.deletUserData();
      showMessage(message: "Logout Successful", type: MessageType.success);
      navigateTo(toPage: const LoginView(), dontRemove: false);
    } else {
      emit(LogoutFailed());
      CacheHelper.deletUserData();
      showMessage(message: response.message);
      navigateTo(toPage: const LoginView(), dontRemove: false);
    }
  }
}

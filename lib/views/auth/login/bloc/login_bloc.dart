import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/core/logic/cache_helper.dart';

import '../../../../constants/end_point.dart';
import '../../../../core/logic/dio_helper.dart';
import '../../../../core/logic/helper_mothods.dart';
import '../../../alert_dialogs/select_supply_view.dart';
import '../login_model.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginStates> {
  LoginBloc() : super(LoginStates()) {
    on<LoginEvent>(_login);
  }

  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static String? token;
  static String? id;

  Future<void> _login(LoginEvent event, Emitter<LoginStates> emit) async {
    ScaffoldMessenger.of(navigatorKey.currentContext!).removeCurrentSnackBar();
    if (formKey.currentState!.validate()) {
      emit(LoginLoadingState());
      var response = await DioHelper.sendData(
        endPoint: EndPoint.logIn,
        data: {
          'username': userNameController.text,
          'password': passwordController.text,
          'token':
              "d0pzeAnWRhC37Kqd-3KIUc:APA91bGyw_qtBgmp08BWo1wyfFwCFKKURdYMd1u4oEKq39OLqD-0nKBcD4gWWa0hj6ElCS8OitwzgqI1D-pvREYG8LMkaA40h-e5zr4x76_cvRKtqUIeLCwynaqJWRd9mxprpQu7xp28",
        },
      );

      if (response.isSuccess) {
        emit(LoginSuccessState());
        final model = UserData.fromJson(response.response!.data);
        token = model.token;
        id = model.id;
        print("token=>  ${token!}");
        CacheHelper.saveUserData(model: model);
        showMessage(
            message: "You must Select a Supplier Cell ",
            type: MessageType.success);
        await Future.delayed(const Duration(milliseconds: 800));
        if (!navigatorKey.currentContext!.mounted) return;
        showDialog(
          context: navigatorKey.currentContext!,
          builder: (context) => const SelectSupplyView(),
        );
      } else {
        emit(LoginFailedState());
        showMessage(message: response.message);
      }
    } else {
      autovalidateMode = AutovalidateMode.onUserInteraction;
    }
  }
}

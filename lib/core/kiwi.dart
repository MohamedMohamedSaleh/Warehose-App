import 'package:kiwi/kiwi.dart';
import 'package:warehouse/views/auth/login/bloc/login_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((container) => LoginBloc());
}

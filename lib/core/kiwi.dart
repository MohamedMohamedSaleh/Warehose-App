import 'package:kiwi/kiwi.dart';
import 'package:warehouse/features/add_product/bloc/add_product_bloc.dart';
import 'package:warehouse/features/notiffications/cubit/notifications_cubit.dart';
import 'package:warehouse/features/select_supply/select_supply_bloc.dart';
import 'package:warehouse/views/auth/login/bloc/login_bloc.dart';
import 'package:warehouse/views/auth/logout/logout_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => SelectSupplyBloc());
  container.registerFactory((container) => AddProductBloc());
  container.registerFactory((container) => LogoutBloc());
  container.registerSingleton((container) => NotificationsCubit());
}

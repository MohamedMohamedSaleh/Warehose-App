import 'package:kiwi/kiwi.dart';
import 'package:warehouse/features/monitoring/bloc/monitoring_bloc.dart';
import 'package:warehouse/features/orders/orders_bloc.dart';
import 'package:warehouse/features/products/add_product/bloc/add_product_bloc.dart';
import 'package:warehouse/features/notiffications/notifications_cubit.dart';
import 'package:warehouse/features/products/show_request_product/show_request_product_bloc.dart';
import 'package:warehouse/features/select_supply/select_supply_bloc.dart';
import 'package:warehouse/views/auth/login/bloc/login_bloc.dart';
import 'package:warehouse/views/auth/logout/logout_bloc.dart';

void initKiwi() {
  KiwiContainer container = KiwiContainer();

  container.registerFactory((container) => LoginBloc());
  container.registerFactory((container) => SelectSupplyBloc());
  container.registerFactory((container) => AddProductBloc());
  container.registerFactory((container) => ShowRequestProductBloc());
  container.registerFactory((container) => OrdersBloc());
  container.registerFactory((container) => LogoutBloc());
  container.registerSingleton((container) => MonitoringBloc());
  container.registerSingleton((container) => NotificationsCubit());
}

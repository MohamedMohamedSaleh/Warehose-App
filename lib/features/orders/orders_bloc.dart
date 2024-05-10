import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/orders/model.dart';

part 'orders_event.dart';
part 'orders_state.dart';

class OrdersBloc extends Bloc<OrdersEvents, OrdersStates> {
  OrdersBloc() : super(OrdersInitial()) {
    on<GetOrdersEvent>(_getOrders);
  }

  List<Orders> putList = [];
  List<Orders> requestList = [];
  Future<void> _getOrders(
      GetOrdersEvent event, Emitter<OrdersStates> emit) async {
    emit(GetOrdersLoading());
    final response =
        await DioHelper.getData(endPoint: EndPoint.getOrders, data: {
      'token': CacheHelper.getUserToken(),
      'userid': CacheHelper.getUserId(),
    });

    if (response.isSuccess) {
      final model = OrdersData.fromJson(response.response!.data);

      for (var element in model.orders) {
        if (element.type == "put") {
          putList.add(element);
        } else {
          requestList.add(element);
        }
      }

      emit(GetOrdersSuccess());
    } else {
      emit(GetOrdersFailed());
      showMessage(message: response.message);
    }
  }
}

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/products/models/products_model.dart';

part 'show_request_product_event.dart';
part 'show_request_product_state.dart';

class ShowRequestProductBloc
    extends Bloc<ShowRequestProductEvents, ShowRequestProductStates> {
  ShowRequestProductBloc() : super(ShowRequestProductInitial()) {
    on<ShowProductEvent>(_showProducts);
    on<RequestProductEvent>(_requestProduc);
  }

  List<ProductModel> list = [];

  Future<void> _showProducts(
      ShowProductEvent event, Emitter<ShowRequestProductStates> emit) async {
    if (event.isLoading) {
      emit(ShowProductLoadingState());
    }
    final response =
        await DioHelper.getData(endPoint: EndPoint.showProduct, data: {
      'token': CacheHelper.getUserToken(),
      'userid': CacheHelper.getUserId(),
    });
    if (response.isSuccess) {
      final model = ProductsData.fromJson(response.response!.data);
      list = model.list;
      emit(ShowProductSuccessState());
    } else {
      showMessage(message: response.message);

      emit(ShowProductFailedState());
    }
  }

  Future<void> _requestProduc(
      RequestProductEvent event, Emitter<ShowRequestProductStates> emit) async {
    emit(RequestProductLoadingState(id: event.id));

    final response =
        await DioHelper.sendData(endPoint: EndPoint.requestProduct, data: {
      "ProductID": event.id,
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
    });
    if (response.isSuccess) {
      showMessage(
          message: 'Successful Request. waiting...', type: MessageType.success);
      add(ShowProductEvent(isLoading: false));
      emit(ShowProductSuccessState());
    } else {
      showMessage(message: response.message);
      emit(ShowProductFailedState());
    }
  }
}

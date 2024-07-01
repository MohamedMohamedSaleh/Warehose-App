import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/end_point.dart';
import '../../../core/logic/cache_helper.dart';
import '../../../core/logic/dio_helper.dart';
import '../../../core/logic/helper_mothods.dart';
import '../errors_model.dart';

part 'errors_event.dart';
part 'errors_state.dart';

class ErrorsBloc extends Bloc<ErrorsEvents, ErrorsStates> {
  ErrorsBloc() : super(ErrorsInitial()) {
    on<GetErrorsEvent>(_getData);
    on<FixErrorsEvent>(_fixError);
  }

  List<ErrorModel> list = [];

  Future<void> _getData(
      GetErrorsEvent event, Emitter<ErrorsStates> emit) async {
        if(event.isLoading){

    emit(GetErrrorsLoading());
        }

    final respose =
        await DioHelper.getData(endPoint: EndPoint.getErrors, data: {
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
    });

    if (respose.isSuccess) {
      final model = ErrorsData.fromJson(respose.response!.data);
      list = model.errors;
      emit(GetErrrorsSuccess());
    } else {
      showMessage(message: respose.message);
      emit(GetErrrorsFailed());
    }
  }

  Future<void> _fixError(
      FixErrorsEvent event, Emitter<ErrorsStates> emit) async {
    emit(FixErrrorsLoading(id: event.id));
    final respose =
        await DioHelper.sendData(endPoint: EndPoint.fixErrors, data: {
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
      "error_id": event.id,
    });
    if (respose.isSuccess) {
      showMessage(message: /* "Fix Error Success." */ respose.message, type: MessageType.success);
      add(GetErrorsEvent(isLoading: false));
      emit(FixErrrorsSuccess());
    } else {
      showMessage(message: "Fix Error Failed!");
      emit(FixErrrorsFailed());
    }
  }
}

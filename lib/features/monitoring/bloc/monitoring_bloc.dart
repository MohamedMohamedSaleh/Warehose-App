import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warehouse/constants/end_point.dart';
import 'package:warehouse/core/logic/cache_helper.dart';
import 'package:warehouse/core/logic/dio_helper.dart';
import 'package:warehouse/core/logic/helper_mothods.dart';
import 'package:warehouse/features/monitoring/monitoring_model.dart';

part 'monitoring_event.dart';
part 'monitoring_state.dart';

class MonitoringBloc extends Bloc<MonitoringEvents, MonitoringStates> {
  MonitoringBloc() : super(MonitoringInitial()) {
    on<GetMonitoringEvent>(_getData);
  }

  bool isLoading = true;

  Future<void> _getData(
      GetMonitoringEvent event, Emitter<MonitoringStates> emit) async {
    if (isLoading) {
      emit(GetMonitoringLoading());
    }
    final respose =
        await DioHelper.getData(endPoint: EndPoint.monitoring, data: {
      "token": CacheHelper.getUserToken(),
      "userid": CacheHelper.getUserId(),
    });

    if (respose.isSuccess) {
      final model = MonitoringData.fromJson(respose.response!.data);
      print(model.map);
      print(model.robots[0].robotPosition);
      print(model.robots[1].robotPosition);
      emit(GetMonitoringSuccess(model: model));
      isLoading = false;
    } else {
      showMessage(message: respose.message);
      emit(GetMonitoringFailed());
    }
  }
}

part of 'select_supply_bloc.dart';

class SelectSupplyEvents {}

class SelectSupplyEvent extends SelectSupplyEvents {
  final String supid;
  final bool isLogin;

  SelectSupplyEvent({required this.supid, required this.isLogin});
}

class SelectSupp1Event extends SelectSupplyEvents {}

class SelectSupp2Event extends SelectSupplyEvents {}

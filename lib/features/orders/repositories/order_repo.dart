import 'package:comprehensive_pharmacy_driver_role/features/orders/models/change_ready_model.dart';

abstract class OrderRepo{
  Future<ChangeReadyModel> changeReady();
}
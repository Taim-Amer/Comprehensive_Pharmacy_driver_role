import 'package:comprehensive_pharmacy_driver_role/features/orders/models/accept_order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/change_ready_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/reject_order_model.dart';

abstract class OrderRepo{
  Future<ChangeReadyModel> changeReady();
  Future<AcceptOrderModel> accept({required int orderID});
  Future<RejectOrderModel> reject({required int orderID});
  Future<AcceptOrderModel> confirm({required int orderID});
  Future<OrdersModel> getOrders();
}
import 'package:comprehensive_pharmacy_driver_role/features/orders/repositories/order_repo.dart';
import 'package:get/get.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => Get.find();
}
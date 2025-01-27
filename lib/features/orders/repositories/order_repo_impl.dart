import 'package:comprehensive_pharmacy_driver_role/features/orders/models/accept_order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/change_ready_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/reject_order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/repositories/order_repo.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/api/dio_helper.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/storage/cache_helper.dart';
import 'package:get/get.dart';

class OrderRepoImpl implements OrderRepo{
  static OrderRepoImpl get instance => Get.find();

  final String? token = TCacheHelper.getData(key: 'token');
  final dioHelper = TDioHelper();

  @override
  Future<ChangeReadyModel> changeReady() async{
    return await dioHelper.post(TApiConstants.change, {}, token: token).then((response) => ChangeReadyModel.fromJson(response));
  }

  @override
  Future<AcceptOrderModel> accept({required int orderID}) async{
    return await dioHelper.post(TApiConstants.accept, {'order_id' : orderID}, token: token).then((response) => AcceptOrderModel.fromJson(response));
  }

  @override
  Future<AcceptOrderModel> confirm({required int orderID}) async{
    return await dioHelper.post(TApiConstants.confirm, {'order_id' : orderID}, token: token).then((response) => AcceptOrderModel.fromJson(response));
  }

  @override
  Future<OrdersModel> getOrders() async{
    return await dioHelper.get(TApiConstants.getOrders, token: token).then((response) => OrdersModel.fromJson(response));
  }

  @override
  Future<RejectOrderModel> reject({required int orderID}) async{
    return await dioHelper.post(TApiConstants.reject, {'order_id' : orderID}, token: token).then((response) => RejectOrderModel.fromJson(response));
  }
}
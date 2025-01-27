import 'package:comprehensive_pharmacy_driver_role/features/orders/models/change_ready_model.dart';
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
}
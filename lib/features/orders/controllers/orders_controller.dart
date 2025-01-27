import 'package:comprehensive_pharmacy_driver_role/common/widgets/alerts/snackbar.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/accept_order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/change_ready_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/order_details_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/models/reject_order_model.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/repositories/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_driver_role/localization/keys.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/logging/logger.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  final pageController = PageController(viewportFraction: .8);
  Rx<int> currentPageIndex = 0.obs;
  Rx<bool> readyStatus = true.obs;

  Rx<RequestState> getOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> changeReadyApiStatus = RequestState.begin.obs;
  Rx<RequestState> orderDetailsApiStatus = RequestState.begin.obs;
  Rx<RequestState> confirmApiStatus = RequestState.begin.obs;
  Rx<RequestState> rejectApiStatus = RequestState.begin.obs;
  //=====
  Rx<RequestState> acceptApiStatus = RequestState.begin.obs;

  final ordersModel = OrdersModel().obs;
  final changeReadyModel = ChangeReadyModel().obs;
  final orderDetailsModel = OrderDetailsModel().obs;
  final confirmModel = AcceptOrderModel().obs;
  final rejectModel = RejectOrderModel().obs;
  //====
  final acceptModel = AcceptOrderModel().obs;

  @override
  void onReady() {
    getOrders();
    super.onReady();
  }


  var selectedChips = <bool>[true, false, false, false].obs;
  var orderStatusChipList = <String>[
    TEnglishTexts.newOrders,
    TEnglishTexts.currentOrders,
    TEnglishTexts.rejected,
    TEnglishTexts.finishedOrders,
  ].obs;

  void toggleChipSelection(int index, bool isSelected) {
    selectedChips[index] = isSelected;
  }

  void updatePageIndicator(index) => currentPageIndex = index;

  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pageController.jumpTo(index);
  }

  Future<bool> changeReady() async{
    THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.changeReady().then((response){
      if(response.status == true){
        THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.success);
        if(response.data!.status == true){
          readyStatus.value = true;
        }else if(response.data!.status == false){
          readyStatus.value = false;
        }
      } else{
        THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.warning);
    });
    return readyStatus.value;
  }

  Future<void> getOrders() async{
    THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.getOrders().then((response){
      if(response.status == true){
        ordersModel.value = response;
        // if (myOrdersModel.value.data is List && (myOrdersModel.value.data as List).isEmpty) {
        //   THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.loading);
        //   THelperFunctions.updateApiStatus(target: getMyOrdersApiStatus, value: RequestState.noData);
        //   emptyForm(status!);
        // }
        THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.success);
      } else{
        THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: getOrdersApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> showOrder({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.showOrder(orderID: orderID).then((response){
      if(response.status == true){
        orderDetailsModel.value = response;
        THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.success);
        // Get.to(() => const OrderDetailsScreen());
      } else{
        THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: orderDetailsApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> confirm({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.confirm(orderID: orderID).then((response){
      if(response.status == true){
        confirmModel.value = response;
        THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.success);
        // Get.off(() => DriversMap(drivers: driversModel.value.drivers ?? []), transition: Transition.rightToLeft);
        // TCacheHelper.saveData(key: 'order_id', value: orderID);
        // getMyOrders(status: "pending");
      } else{
        THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: confirmApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }

  Future<void> reject({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.reject(orderID: orderID).then((response){
      if(response.status == true){
        rejectModel.value = response;
        THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.success);
        // Get.back();
        // getMyOrders(status: "pending");
        showSnackBar(response.message ?? '', AlertState.success);
      } else{
        THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: rejectApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }



}

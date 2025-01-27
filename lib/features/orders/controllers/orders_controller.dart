import 'package:comprehensive_pharmacy_driver_role/features/orders/repositories/order_repo_impl.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  final pageController = PageController(viewportFraction: .8);
  Rx<int> currentPageIndex = 0.obs;
  Rx<bool> readyStatus = true.obs;


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
    return true;
    // THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.loading);
    // await OrderRepoImpl.instance.changeReady().then((response){
    //   if(response.status == true){
    //     THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.success);
    //     if(response.data!.status == true){
    //       readyStatus.value = true;
    //     }else if(response.data!.status == false){
    //       readyStatus.value = false;
    //     }
    //   } else{
    //     THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
    //     showSnackBar(response.message ?? '', AlertState.warning);
    //   }
    // }).catchError((error){
    //   THelperFunctions.updateApiStatus(target: changeReadyApiStatus, value: RequestState.error);
    //   showSnackBar(TranslationKey.kErrorMessage, AlertState.warning);
    // });
    // return readyStatus.value;
  }

}

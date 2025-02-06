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
import 'package:comprehensive_pharmacy_driver_role/utils/services/map_services.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class OrdersController extends GetxController {
  static OrdersController get instance => Get.find<OrdersController>();

  final pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;
  Rx<bool> readyStatus = true.obs;
  Rx<bool> isAccepted = false.obs;
  Rx<bool> isRejected = false.obs;

  Rx<RequestState> getOrdersApiStatus = RequestState.begin.obs;
  Rx<RequestState> changeReadyApiStatus = RequestState.begin.obs;
  Rx<RequestState> orderDetailsApiStatus = RequestState.begin.obs;
  Rx<RequestState> confirmApiStatus = RequestState.begin.obs;
  Rx<RequestState> rejectApiStatus = RequestState.begin.obs;
  Rx<RequestState> acceptApiStatus = RequestState.begin.obs;

  final ordersModel = OrdersModel().obs;
  final changeReadyModel = ChangeReadyModel().obs;
  final orderDetailsModel = OrderDetailsModel().obs;
  final confirmModel = AcceptOrderModel().obs;
  final rejectModel = RejectOrderModel().obs;
  final acceptModel = AcceptOrderModel().obs;

  //Map
  final MapController mapController = MapController();
  final RxBool mapMovedManually = false.obs;
  final Rx<LatLng?> currentLocation = Rx<LatLng?>(null);
  // late LatLng initialCustomerPosition;
  // late LatLng initialPharmacyPosition;
  final Rxn<LatLng> initialCustomerPosition = Rxn<LatLng>();
  final Rxn<LatLng> initialPharmacyPosition = Rxn<LatLng>();

  final RxList<Polyline> polylines = <Polyline>[].obs;


  @override
  void onReady() async{
    await getOrders();
    initializePositions();
    TMapServices.initializeLocation((location) {
      currentLocation.value = location;
      mapController.move(location, 15);
      // _updateRoutes();
    });
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

  Future<void> initializePositions({int? index}) async {
    print("=============================================");
    final ordersData = ordersModel.value.data?.data;

    if (ordersData != null && ordersData.isNotEmpty) {
      initialCustomerPosition.value = LatLng(
        double.tryParse(ordersData[index ?? 0].customer?.lat ?? '0') ?? 0.0,
        double.tryParse(ordersData[index ?? 0].customer?.lng ?? '0') ?? 0.0,
      );
      initialPharmacyPosition.value = LatLng(
        double.tryParse(ordersData[index ?? 0].pharmacist?.lat ?? '0') ?? 0.0,
        double.tryParse(ordersData[index ?? 0].pharmacist?.lng ?? '0') ?? 0.0,
      );
      print(initialPharmacyPosition);
      print(initialCustomerPosition);
    } else {
      initialCustomerPosition.value = const LatLng(0, 0);
      initialPharmacyPosition.value = const LatLng(0, 0);
    }
    // _updateRoutes();
  }

  void onPositionChanged(MapCamera position, bool hasGesture) {
    if (hasGesture) {
      mapMovedManually.value = true;
    }
  }

  Future<void> _updateRoutes() async {
    final currentLocation = this.currentLocation.value;
    if (currentLocation == null) return;

    // TMapServices.getRoute(currentLocation, initialCustomerPosition.value!);

    TMapServices.getRoute(currentLocation, initialPharmacyPosition.value!);
    if (initialCustomerPosition.value != null && initialPharmacyPosition.value != null) {
      TMapServices.getRoute(initialPharmacyPosition.value!, initialCustomerPosition.value!);
    }
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
        TCacheHelper.saveData(key: 'order_id', value: response.data?.data?.firstOrNull!.id);
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
        isRejected.value = true;
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

  Future<void> accept({required int orderID}) async{
    THelperFunctions.updateApiStatus(target: acceptApiStatus, value: RequestState.loading);
    await OrderRepoImpl.instance.accept(orderID: orderID).then((response){
      if(response.status == true){
        isAccepted.value = true;
        acceptModel.value = response;
        THelperFunctions.updateApiStatus(target: acceptApiStatus, value: RequestState.success);
        // Get.back();
        // getMyOrders(status: "pending");
        showSnackBar(response.message ?? '', AlertState.success);
      } else{
        THelperFunctions.updateApiStatus(target: acceptApiStatus, value: RequestState.error);
        showSnackBar(response.message ?? '', AlertState.warning);
      }
    }).catchError((error){
      TLoggerHelper.error(error.toString());
      THelperFunctions.updateApiStatus(target: acceptApiStatus, value: RequestState.error);
      showSnackBar(TranslationKey.kErrorMessage, AlertState.error);
    });
  }
}

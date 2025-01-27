import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/bottom_sheet_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<dynamic> showOrderDetailsBottomsheet({required String name, required String phone, required int distance, required int driverID}){
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: false,
    context: Get.context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SizedBox(
        height: 460.h,
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: BottomSheetBody(),
        ),
      );
    },
  );
}
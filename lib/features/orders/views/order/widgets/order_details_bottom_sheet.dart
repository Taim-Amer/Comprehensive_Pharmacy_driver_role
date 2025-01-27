import 'package:comprehensive_pharmacy_driver_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/bottom_sheet_body.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/description_item.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/device/device_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

Future<dynamic> showOrderDetailsBottomsheet({required String name, required String phone, required int distance, required int driverID}){
  return showModalBottomSheet(
    isScrollControlled: true,
    showDragHandle: false,
    context: Get.context!,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState){
          return SizedBox(
            height: 460.h,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: BottomSheetBody(),
            ),
          );
        },
      );
    },
  );
}
import 'package:comprehensive_pharmacy_driver_role/common/widgets/loaders/loading_widget.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetFooter extends StatelessWidget {
  const BottomSheetFooter({super.key, required this.orderID});

  final int orderID;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrdersController.instance.rejectApiStatus.value ==
                      RequestState.loading
                  ? SizedBox(height: 40.h, child: const LoadingWidget())
                  : Expanded(
                      child: SizedBox(
                          height: 40.h,
                          child: OutlinedButton(
                              onPressed: () => OrdersController.instance
                                  .reject(orderID: orderID),
                              child: Text(TEnglishTexts.reject))),
                    ),
              TSizes.sm.horizontalSpace,
              OrdersController.instance.acceptApiStatus.value ==
                      RequestState.loading
                  ? SizedBox(height: 40.h, child: const LoadingWidget())
                  : Expanded(
                      child: SizedBox(
                          height: 40.h,
                          child: ElevatedButton(
                              onPressed: () => OrdersController.instance
                                  .accept(orderID: orderID),
                              child: Text(TEnglishTexts.accept))),
                    ),
            ],
          )),
    );
  }
}

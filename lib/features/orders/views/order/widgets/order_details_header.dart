import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDetailsHeader extends StatelessWidget {
  const OrderDetailsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TCircularIcon(
          icon: Icons.arrow_back_ios_new_rounded,
          showBorder: false,
          onPressed: () {
            if (OrdersController.instance.currentPageIndex.value > 0) {
              OrdersController.instance.currentPageIndex.value--;
              OrdersController.instance.pageController.animateToPage(
                OrdersController.instance.currentPageIndex.value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
        Obx(() => Text(
          "Order ${OrdersController.instance.currentPageIndex.value}/${OrdersController.instance.ordersModel.value.data?.data?.length}",
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
        )),
        TCircularIcon(
          icon: Icons.arrow_forward_ios_rounded,
          showBorder: false,
          onPressed: () {
            if (OrdersController.instance.currentPageIndex.value <
                (OrdersController.instance.ordersModel.value.data?.data?.length ?? 0)) {
              OrdersController.instance.currentPageIndex.value++;
              OrdersController.instance.pageController.animateToPage(
                OrdersController.instance.currentPageIndex.value,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          },
        ),
      ],
    );
  }
}

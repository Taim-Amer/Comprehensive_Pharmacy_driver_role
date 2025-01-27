import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/bottom_sheet_footer.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/order_details_header.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/order_details_view.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const OrderDetailsHeader(),
        const Expanded(
          child: OrderDetailsView(),
        ),
        TSizes.spaceBtwItems.verticalSpace,
        const BottomSheetFooter()
      ],
    );
  }
}


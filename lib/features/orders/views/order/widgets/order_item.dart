import 'package:comprehensive_pharmacy_pharmacy_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:iconsax/iconsax.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, this.showViewButton = true});

  final bool showViewButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: TSizes.defaultSpace.w,
        vertical: TSizes.spaceBtwItems.h,
      ),
      child: TRoundedContainer(
        height: 150.h,
        showBorder: true,
        borderColor: const Color(0xFFE0E0E0),
        backgroundColor: Colors.transparent,
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TEnglishTexts.customerName, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                    Text(TEnglishTexts.orderNo, style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Iconsax.mobile, size: 20),
                        TSizes.xs.horizontalSpace,
                        Text(TEnglishTexts.phoneNumber, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500)),
                      ],
                    ),
                    Text(TEnglishTexts.orderNo, style: Theme.of(context).textTheme.labelLarge)
                  ],
                ),
              ],
            ),
            TRoundedContainer(
              width: double.infinity,
              height: 1.h,
              backgroundColor: TColors.grey,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(TEnglishTexts.orderDate, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tue , 10 Sept 12:20 PM', style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w400, fontSize: 12)),
                  ],
                ),
              ],
            ),
            showViewButton ? SizedBox(
              height: 36.h,
              child: ElevatedButton(onPressed: (){}, child: Text(TEnglishTexts.viewOrders)),
            ) : const SizedBox(),
          ],
        ),
      ),
    );
  }
}

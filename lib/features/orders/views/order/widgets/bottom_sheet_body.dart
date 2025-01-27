import 'package:comprehensive_pharmacy_driver_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/bottom_sheet_footer.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/description_item.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/formatters/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class BottomSheetBody extends StatelessWidget {
  const BottomSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                if (OrdersController.instance.currentPageIndex.value > 0) {
                  OrdersController.instance.currentPageIndex.value--;
                  OrdersController.instance.pageController.animateToPage(
                      OrdersController.instance.currentPageIndex.value,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                }
              },
              child: const TCircularIcon(
                icon: Icons.arrow_back_ios_new_rounded,
                showBorder: false,
              ),
            ),
            Obx(() => Text(
              "Order ${OrdersController.instance.currentPageIndex.value + 1}/${OrdersController.instance.ordersModel.value.data?.data?.length}",
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500),
            )),
            GestureDetector(
              onTap: () {
                if (OrdersController.instance.currentPageIndex.value < 1) {
                  OrdersController.instance.currentPageIndex.value++;
                  OrdersController.instance.pageController.animateToPage(
                    OrdersController.instance.currentPageIndex.value,
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                }
              },
              child: const TCircularIcon(
                icon: Icons.arrow_forward_ios_rounded,
                showBorder: false,
              ),
            ),
          ],
        ),
        //====================srtart
        Expanded(
          child: PageView.builder(
            itemCount: OrdersController.instance.ordersModel.value.data?.data?.length,
            controller: OrdersController.instance.pageController,
            onPageChanged: (index) => OrdersController.instance.currentPageIndex.value = index,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TRoundedContainer(width: double.infinity, height: 1, backgroundColor: Color(0xFFE7E7E7)),
                  ),
                  TSizes.spaceBtwItems.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DescriptionItem(image: TImages.pharmaIcon, title: TEnglishTexts.pharmacyName, subTitle: OrdersController.instance.ordersModel.value.data?.data?[index].pharmacist!.pharmacy!.pharmacyName ?? ''),
                      DescriptionItem(image: TImages.calenderIcon, title: TEnglishTexts.orderDate, subTitle: TFormatter.formatDate(OrdersController.instance.ordersModel.value.data?.data?[index].createdAt ?? '')),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TRoundedContainer(width: double.infinity, height: 1, backgroundColor: Color(0xFFE7E7E7)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DescriptionItem(image: TImages.mobileIcon, title: TEnglishTexts.phoneNumber, subTitle: TFormatter.formatPhoneNumber(OrdersController.instance.ordersModel.value.data?.data?[index].pharmacist!.phone ?? '')),
                      DescriptionItem(image: TImages.locationIcon, title: TEnglishTexts.location, subTitle: "Order No: # 34566"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TRoundedContainer(width: double.infinity, height: 1, backgroundColor: Color(0xFFE7E7E7)),
                  ),
                  DescriptionItem(image: TImages.noteIcon, title: TEnglishTexts.note, subTitle: "Order No: # 34566", showDes: false),
                  TSizes.spaceBtwItems.verticalSpace,
                  Expanded(
                      child: TRoundedContainer(
                        width: double.infinity,
                        backgroundColor: const Color(0xFFE7E7E7),
                        height: 100.h,
                        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace, vertical: TSizes.sm),
                        child: Text(OrdersController.instance.ordersModel.value.data?.data?[index].description ?? "No notes for this order ..."),
                      ),
                  ),
                ],
              ),
            ),
          ),
        ),
        //=====================End
        TSizes.spaceBtwItems.verticalSpace,
        const BottomSheetFooter()
      ],
    );
  }
}


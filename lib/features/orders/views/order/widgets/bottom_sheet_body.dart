import 'package:comprehensive_pharmacy_driver_role/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/description_item.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/image_strings.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetBody extends StatefulWidget {
  BottomSheetBody({super.key});

  int currentPage = 0;

  @override
  State<BottomSheetBody> createState() => _BottomSheetBodyState();
}

class _BottomSheetBodyState extends State<BottomSheetBody> {
  final PageController pageController = PageController();

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
                if (widget.currentPage > 0) {
                  setState(() {
                    widget.currentPage--;
                    pageController.animateToPage(
                      widget.currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
                }
              },
              child: const TCircularIcon(
                icon: Icons.arrow_back_ios_new_rounded,
                showBorder: false,
              ),
            ),
            Text(
              "Order ${widget.currentPage + 1}/2",
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            GestureDetector(
              onTap: () {
                if (widget.currentPage < 1) {
                  setState(() {
                    widget.currentPage++;
                    pageController.animateToPage(
                      widget.currentPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  });
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
            controller: pageController,
            onPageChanged: (index) => setState(() => widget.currentPage = index),
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
                      DescriptionItem(image: TImages.pharmaIcon, title: TEnglishTexts.pharmacyName, subTitle: "Order No: # 34566"),
                      DescriptionItem(image: TImages.calenderIcon, title: TEnglishTexts.orderDate, subTitle: "Order No: # 34566"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TRoundedContainer(width: double.infinity, height: 1, backgroundColor: Color(0xFFE7E7E7)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DescriptionItem(image: TImages.mobileIcon, title: TEnglishTexts.phoneNumber, subTitle: "Order No: # 34566"),
                      DescriptionItem(image: TImages.locationIcon, title: TEnglishTexts.location, subTitle: "Order No: # 34566"),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TRoundedContainer(width: double.infinity, height: 1, backgroundColor: Color(0xFFE7E7E7)),
                  ),
                  DescriptionItem(image: TImages.noteIcon, title: TEnglishTexts.pharmacyName, subTitle: "Order No: # 34566", showDes: false),
                  TSizes.spaceBtwItems.verticalSpace,
                  Expanded(child: TRoundedContainer(backgroundColor: const Color(0xFFE7E7E7), height: 100.h,)),
                ],
              ),
            ),
            itemCount: 5,
          ),
        ),
        //=====================End
        TSizes.spaceBtwItems.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(child: SizedBox(height: 40.h, child: OutlinedButton(onPressed: (){}, child: Text(TEnglishTexts.reject)))),
            TSizes.sm.horizontalSpace,
            Expanded(child: SizedBox(height: 40.h, child: ElevatedButton(onPressed: (){}, child: Text(TEnglishTexts.accept)))),
          ],
        ),
      ],
    );
  }
}

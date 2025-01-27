import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomSheetFooter extends StatelessWidget {
  const BottomSheetFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: SizedBox(height: 40.h, child: OutlinedButton(onPressed: (){}, child: Text(TEnglishTexts.reject)))),
        TSizes.sm.horizontalSpace,
        Expanded(child: SizedBox(height: 40.h, child: ElevatedButton(onPressed: (){}, child: Text(TEnglishTexts.accept)))),
      ],
    );
  }
}

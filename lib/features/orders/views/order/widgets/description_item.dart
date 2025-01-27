import 'package:comprehensive_pharmacy_driver_role/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DescriptionItem extends StatelessWidget {
  DescriptionItem({super.key, required this.image, required this.title, required this.subTitle, this.showDes = true});

  final String image;
  final String title;
  final String subTitle;
  bool showDes;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset(image)
          ],
        ),
        TSizes.xs.horizontalSpace,
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w500, fontSize: 14)),
            showDes ? Text(subTitle, style: Theme.of(context).textTheme.labelLarge?.copyWith(fontSize: 12)) : const SizedBox(),
          ],
        )
      ],
    );
  }
}

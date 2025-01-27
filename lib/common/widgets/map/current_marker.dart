import 'package:comprehensive_pharmacy_driver_role/utils/constants/colors.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TCurrentMarker extends StatelessWidget {
  const TCurrentMarker({super.key});

  @override
  Widget build(BuildContext context) {
    return CurrentLocationLayer(
      alignPositionOnUpdate: AlignOnUpdate.always,
      alignDirectionOnUpdate: AlignOnUpdate.never,
      style: LocationMarkerStyle(
        headingSectorRadius: 100,
        // accuracyCircleColor: Colors.transparent,
        headingSectorColor: TColors.primary,
        showAccuracyCircle: false,
        marker: DefaultLocationMarker(
          color: Colors.transparent,
          child: SvgPicture.asset(TImages.motorIcon),
          // child: Icon(
          //   Icons.location_on,
          //   color: Colors.white,
          // ),
        ),
        markerSize: const Size(40, 40),
        markerDirection: MarkerDirection.heading,
      ),
    );
  }
}

import 'package:comprehensive_pharmacy_driver_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/map/road.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/order_details_bottom_sheet.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/services/map_services.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class OrderMap extends StatefulWidget {
  const OrderMap({super.key});

  @override
  State<OrderMap> createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  final MapController _mapController = MapController();
  final TextEditingController _locationController = TextEditingController();

  LatLng? _destination;

  @override
  void initState() {
    super.initState();
    TMapServices.initializeLocation((location) {
      _mapController.move(location, 15);
    });
  }

  void _searchLocation() {
    final location = _locationController.text.trim();
    if (location.isNotEmpty) {
      TMapServices.getCoordinates(location, (destination) {
        setState(() {
          _destination = destination;
          TCacheHelper.saveData(key: 'userLat', value: _destination!.latitude);
          TCacheHelper.saveData(key: 'userLng', value: _destination!.longitude);
        });
        _mapController.move(destination, 15);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      drawer: const GeneralDrawer(),
      body: Column(
        children: [
          Expanded(
            child: ValueListenableBuilder<LatLng?>(
              valueListenable: TMapServices.currentLocationNotifier,
              builder: (context, currentLocation, child) {
                return FlutterMap(
                  mapController: _mapController,
                  options: MapOptions(
                    initialCenter: currentLocation ?? const LatLng(0, 0),
                    initialZoom: 15,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: dark ? TApiConstants.darkMap : TApiConstants.lightMap,
                    ),
                    Padding(
                      padding: TSpacingStyle.paddingWithAppBarHeight,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TCircularIcon(icon: Icons.more_vert, showBorder: true, onPressed: () => Scaffold.of(context).openDrawer(),),
                              TCircularIcon(icon: Iconsax.notification, showBorder: true, onPressed: () => showOrderDetailsBottomsheet(name: "Taim", phone: "0997421905", distance: 1, driverID: 1),),
                            ],
                          ),
                          TSizes.spaceBtwItems.verticalSpace,
                          const OrdersHeader()
                          // const Spacer(),
                          // SizedBox(
                          //   height: 50.h,
                          //   width: double.infinity,
                          //   child: ElevatedButton(onPressed: () => Get.back(), child: Text(TEnglishTexts.tcontinue)),
                          // )
                        ],
                      ),
                    ),
                    const TCurrentMarker(),
                    if (_destination != null)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: _destination!,
                            width: 50,
                            height: 50,
                            child: SvgPicture.asset(TImages.searchIcon, color: dark ? TColors.light : TColors.dark),
                          ),
                        ],
                      ),
                    const TRoad(),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

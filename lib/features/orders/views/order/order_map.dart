import 'package:comprehensive_pharmacy_driver_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/order_details_bottom_sheet.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/services/map_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class OrderMap extends StatefulWidget {
  const OrderMap({super.key});

  @override
  State<OrderMap> createState() => _OrderMapState();
}

class _OrderMapState extends State<OrderMap> {
  final MapController _mapController = MapController();
  bool _mapMovedManually = false;

  late LatLng initialCustomerPosition;
  late LatLng initialPharmacyPosition;

  @override
  void initState() {
    super.initState();
    TMapServices.initializeLocation((location) {
      _mapController.move(location, 15);
    });
  }

  Future<void> _initializePositions() async {
    final ordersData = OrdersController.instance.ordersModel.value.data?.data;

    if (ordersData != null && ordersData.isNotEmpty) {
      initialCustomerPosition = LatLng(
        double.tryParse(ordersData.last.customer?.lat ?? '0') ?? 0.0,
        double.tryParse(ordersData.last.customer?.lng ?? '0') ?? 0.0,
      );
      initialPharmacyPosition = LatLng(
        double.tryParse(ordersData.last.pharmacist?.lat ?? '0') ?? 0.0,
        double.tryParse(ordersData.last.pharmacist?.lng ?? '0') ?? 0.0,
      );
    } else {
      // Default values if no data is available
      initialCustomerPosition = const LatLng(0, 0); // San Francisco
      initialPharmacyPosition = const LatLng(0, 0); // Nearby point
    }
  }

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return FutureBuilder(
      future: _initializePositions(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error loading data: ${snapshot.error}'));
        }

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
                        initialCenter: initialCustomerPosition,
                        initialZoom: 15,
                        onPositionChanged: (position, hasGesture) {
                          if (hasGesture) {
                            _mapMovedManually = true;
                          }
                        },
                      ),
                      children: [
                        TileLayer(
                          urlTemplate: dark
                              ? TApiConstants.darkMap
                              : TApiConstants.lightMap,
                        ),
                        Padding(
                          padding: TSpacingStyle.paddingWithAppBarHeight,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  TCircularIcon(
                                    icon: Icons.more_vert,
                                    showBorder: true,
                                    onPressed: () => Scaffold.of(context).openDrawer(),
                                  ),
                                  TCircularIcon(
                                    icon: Iconsax.notification,
                                    showBorder: true,
                                    onPressed: () => showOrderDetailsBottomsheet(
                                      name: "Taim",
                                      phone: "0997421905",
                                      distance: 1,
                                      driverID: 1,
                                    ),
                                  ),
                                ],
                              ),
                              TSizes.spaceBtwItems.verticalSpace,
                              const OrdersHeader(),
                            ],
                          ),
                        ),
                        const TCurrentMarker(),
                        MarkerLayer(
                          markers: [
                            // Customer Point
                            Marker(
                              point: initialCustomerPosition,
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(TImages.customerIcon),
                            ),
                            // Pharmacy Point
                            Marker(
                              point: initialPharmacyPosition,
                              width: 50,
                              height: 50,
                              child: SvgPicture.asset(TImages.pharmaIcon),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

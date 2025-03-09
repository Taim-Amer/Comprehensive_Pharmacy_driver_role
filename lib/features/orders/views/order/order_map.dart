import 'package:comprehensive_pharmacy_driver_role/common/styles/spacing_styles.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/appbar/appbar.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/icons/circular_icon.dart';
import 'package:comprehensive_pharmacy_driver_role/common/widgets/map/current_marker.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/controllers/orders_controller.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/general_drawer.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/order_details_bottom_sheet.dart';
import 'package:comprehensive_pharmacy_driver_role/features/orders/views/order/widgets/orders_header.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/api_constants.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/constants/enums.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/exports.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/services/map_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:latlong2/latlong.dart';

class OrderMap extends StatelessWidget {
  const OrderMap({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = OrdersController.instance;
    final dark = THelperFunctions.isDarkMode(context);

    return Obx((){
      final routes = TMapServices.routeNotifier.value;
      return OrdersController.instance.getOrdersApiStatus.value != RequestState.success ? const Scaffold(appBar: TAppBar(), body: Center(child: CircularProgressIndicator(color: TColors.primary)),) : Scaffold(
        drawer: const GeneralDrawer(),
        floatingActionButton: FloatingActionButton(onPressed: () => OrdersController.instance.updateRoutes(), child: const Icon(Iconsax.eye),),
        body: Column(
          children: [
            Expanded(
              child: ValueListenableBuilder<List<LatLng>>(
                valueListenable: TMapServices.routeNotifier,
                builder: (context, route, child){
                  return FlutterMap(
                    mapController: controller.mapController,
                    options: MapOptions(
                      initialCenter: controller.initialCustomerPosition.value!,
                      initialZoom: 12,
                      onPositionChanged: controller.onPositionChanged,
                    ),
                    children: [
                      TileLayer(
                        urlTemplate: dark ? TApiConstants.darkMap : TApiConstants.lightMap,
                      ),
                      PolylineLayer(
                        polylines: [
                          Polyline(
                            points: routes,
                            strokeWidth: 4.0,
                            color: Colors.blue,
                          ),
                        ],
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
                                  onPressed: () =>
                                      Scaffold.of(context).openDrawer(),
                                ),
                                TCircularIcon(
                                  icon: Iconsax.notification,
                                  showBorder: true,
                                  onPressed: () => showOrderDetailsBottomsheet(),
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
                            point: controller.initialCustomerPosition.value!,
                            width: 50,
                            height: 50,
                            child: SvgPicture.asset(TImages.customerIcon),
                          ),
                          // Pharmacy Point
                          Marker(
                            point: controller.initialPharmacyPosition.value!,
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
    });
  }
}


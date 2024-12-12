import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/home/no_internet_connection_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_details_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/features/orders/views/order/order_screen.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_pharmacy_role/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) =>  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        // initialRoute: AppRoutes.setPassword,
        getPages: AppRoutes.routes,
        // translations: TAppTranslations(),
        // locale: const Locale('en'),
        // fallbackLocale: const Locale('en'),
        // initialBinding: ForgetPasswordBinding(),
        home: const NoInternetConnectionScreen(),
      ),
    );
  }
}
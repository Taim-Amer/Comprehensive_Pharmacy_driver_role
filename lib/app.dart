import 'package:comprehensive_pharmacy_driver_role/dependencies/order_binding.dart';
import 'package:comprehensive_pharmacy_driver_role/localization/translations.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/helpers/helper_functions.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/router/app_router.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/storage/cache_helper.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PharmacyApp extends StatelessWidget {
  const PharmacyApp({super.key});

  @override
  Widget build(BuildContext context) {
    print(TCacheHelper.getData(key: 'token'));
    return ScreenUtilInit(
      designSize: Size(THelperFunctions.screenWidth(context), THelperFunctions.screenHeight(context)),
      builder: (_, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: TAppTheme.lightTheme,
        darkTheme: TAppTheme.darkTheme,
        initialRoute: AppRoutes.order,
        getPages: AppRoutes.routes,
        translations: TAppTranslations(),
        locale: const Locale('en'),
        fallbackLocale: const Locale('en'),
        initialBinding: OrderBinding(),
        // home: const SigninScreen(),
      ),
    );
  }
}
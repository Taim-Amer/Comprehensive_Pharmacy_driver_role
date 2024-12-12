import 'package:comprehensive_pharmacy_driver_role/app.dart';
import 'package:comprehensive_pharmacy_driver_role/utils/storage/cache_helper.dart';
import 'package:flutter/material.dart';

Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();

  await TCacheHelper.init();

  runApp(const PharmacyApp());
}
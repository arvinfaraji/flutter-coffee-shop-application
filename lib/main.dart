import 'package:coffee_app/Core/I18n/translations.dart';
import 'package:coffee_app/cart_controller.dart';
import 'package:coffee_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
void main() {
  Get.put(CartController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: AppTranslations(),
      locale: const Locale('fa'),
      debugShowCheckedModeBanner: false,
      title: 'Coffee Shop',
      theme: ThemeData(
        fontFamily: "Vazir-Matn",
      ),
      home: FutureBuilder(
        future: _updateDefaultLocale(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.data == true) {
            return Directionality(
              textDirection: Get.locale?.languageCode == 'fa' ? TextDirection.rtl : TextDirection.ltr,
              child: const BottomNavigation(),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }

  Future<bool> _updateDefaultLocale() async {
    final shared = await SharedPreferences.getInstance();
    final languageCode = shared.getString('app_language_code') ?? 'fa';
    Get.locale = Locale(languageCode);
    return true;
  }
}
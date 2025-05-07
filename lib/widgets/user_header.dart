import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/screen/login/login.dart';
import 'package:coffee_app/screen/search/search_page.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/widgets/bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            spacing: 8,
            children: [
              Text(
                AppMessages.userName.tr,
                style: TextStyle(
                  color: brownColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SearchPage()),
                  );
                },
                child: Icon(
                  Icons.search,
                  size: 24,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: DropdownButton(
                  items: ['Fa', 'En']
                      .map((e) => DropdownMenuItem(
                            value: e,
                            child: Text(e),
                          ))
                      .toList(),
                  icon: Icon(
                    Icons.language,
                    color: Colors.grey,
                  ),
                  hint: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      Get.locale?.languageCode == 'fa' ? 'فارسی' : 'English',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  onChanged: (value) {
                    if (value == 'Fa') {
                      _updateLocaleWithAnimation('fa');
                    } else if (value == 'En') {
                      _updateLocaleWithAnimation('en');
                    }
                  },
                ),
              ),
              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => Login())),
                child: ClipOval(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Image.asset(
                      'assets/images/team-member.jpg',
                      width: 45,
                      height: 45,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _updateLocaleWithAnimation(String localeCode) async {
    Get.updateLocale(Locale(localeCode));
    final shared = await SharedPreferences.getInstance();
    shared.setString('app_language_code', localeCode);

    // بازنشانی صفحات با انیمیشن
    Get.offAll(
      () => const BottomNavigation(),
      transition: Transition.rightToLeft, // نوع انیمیشن
      duration: const Duration(milliseconds: 500), // مدت زمان انیمیشن
    );
  }
}
import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
         Padding(
           padding: const EdgeInsets.symmetric(vertical: 20.0),
           child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                spacing: 
                8,
                children: [
                  Icon(Icons.person, size: 30, color: brownColor,),
                  Text(AppMessages.userName.tr, style: TextStyle(fontSize: 19),)
                ],
              ),
              Stack(
                children: [
                 ClipOval(
                  child: Image.asset(
                    'assets/images/team-member.jpg',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover, // برای اطمینان از پر شدن تصویر
                  ),
                ),
                Positioned(
                  bottom: -0,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)
                    ),
                    child: Icon(Icons.camera_alt_rounded, size: 30, color: Colors.white,),
                  )
                )
               ]
              ),
            ],
           ),
         ),
    
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
           child: Divider(height: 4, color: Colors.grey,),
         ),
    
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20),
           child: Column(
            spacing: 40,
            children: [
              options(
                iconName: Icon(Icons.design_services, size: 35, color: brownColor,),
                title: AppMessages.changeUserName.tr,
              ),
              options(
                iconName: Icon(Icons.password, size: 35, color: brownColor,),
                title: AppMessages.changePassword.tr,
              ),
              options(
                iconName: Icon(Icons.attach_money_sharp, size: 35, color: brownColor,),
                title: AppMessages.wallet.tr,
              ),
              options(
                iconName: Icon(Icons.shopping_cart_outlined, size: 35, color: brownColor,),
                title: AppMessages.myOrders.tr,
              ),
              options(
                iconName: Icon(Icons.add_shopping_cart, size: 35, color: brownColor,),
                title: AppMessages.orderReservation.tr,
              ),
              options(
                iconName: Icon(Icons.star_half_rounded, size: 35, color: brownColor,),
                title: AppMessages.registerComment.tr,
              ),
            ],
           ),
         )
        ]
      ),
    );

  }
}

// ignore: camel_case_types
class options extends StatelessWidget {
  final String title;
  final Icon iconName;

  const options({
    super.key, required this.title, required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        iconName,
        Text(title, style: TextStyle(fontSize: 19, color: const Color.fromARGB(255, 114, 114, 114)),)
      ],
    );
  }
}
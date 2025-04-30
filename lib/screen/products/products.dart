import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/widgets/products_card.dart';
import 'package:coffee_app/widgets/titles.dart';
import 'package:coffee_app/widgets/user_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {

  final List<String> fillterTypes = [
    AppMessages.coffees.tr,
    AppMessages.drinks_1.tr,
    AppMessages.drinks_2.tr,
    AppMessages.teas,
    AppMessages.cakeTitle.tr,
    AppMessages.desserts.tr
  ];

  int _selectedFillter = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // ناو بار یوزر 
          UserHeader(),
    
          
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 20),
            child: SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: fillterTypes.length,
                itemBuilder: (context, index) {
                  final item = fillterTypes[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedFillter = index;
                      });
                    },
                    child: AnimatedContainer(
                    duration: Duration(milliseconds:200), // مدت زمان انیمیشن
                    curve: Curves.easeIn, // منحنی انیمیشن
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                    decoration: BoxDecoration(
                      color: _selectedFillter == index ? brownColor : Colors.transparent,
                      border: Border.all(width: 1, color: creamColor),
                      borderRadius: BorderRadius.circular(30),
                    ),
                      child: Text(item, style: TextStyle(fontSize: 20, color: _selectedFillter == index ? Colors.white : Colors.black),),
                    ),
                  );
                },
               ),
            ),
          ),
    
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // تایتل 
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0, bottom: 10),
                      child: Titles(titleName: AppMessages.coffees.tr)
                    ),
    
                   products_card(
                     imgUrl: 'esperso.jpg',
                     title: AppMessages.singleHundred.tr,
                     desc: AppMessages.loremIpsum.tr,
                     price: '40.000',
                   ),
                   products_card(
                     imgUrl: '__opt__aboutcom__coeus__resources__content_migration__serious_eats__seriouseats.com__2018__06__20180613-coffee-vs-espresso-vicky-wasik-3-1500x1125-418fa2a14e7249b18040c.jpg',
                     title: AppMessages.singleArabica.tr,
                     desc: AppMessages.loremIpsum.tr,
                     price: '40.000',
                   ),
                   products_card(
                     imgUrl: 'Hot_Espresso_Coffee_in_a_transparent_glass_cup.jpg',
                     title: AppMessages.doubleCoffee.tr,
                     desc: AppMessages.loremIpsum.tr,
                     price: '30.000',
                   ),
                   products_card(
                     imgUrl: 'how-to-make-different-types-of-espresso-drinks_ContentCard17.jpg',
                     title: AppMessages.americanCoffee.tr,
                     desc: AppMessages.loremIpsum.tr,
                     price: '50.000',
                   ),
                   products_card(
                     imgUrl: 'red-espresso-Red-Cappuccino-_5-1724006744.jpg',
                     title: AppMessages.cappuccino.tr,
                     desc: AppMessages.loremIpsum.tr,
                     price: '70.000',
                   ),
    
                    // تایتل 
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: Titles(titleName: AppMessages.smoothie.tr)
                    ),
                    
                    products_card(
                      imgUrl: 'esmoti-anbe-min.jpg',
                      title: AppMessages.mangoSmoothie.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '100.000',
                    ),
                    products_card(
                      imgUrl: 'esmoti-hendevane.jpg',
                      title: AppMessages.mixedSmoothie.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '120.000',
                    ),
                    products_card(
                      imgUrl: 'esmoti-hendevaneh-min.jpg',
                      title: AppMessages.watermelonSmoothie.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '150.000',
                    ),
                    
    
                    // تایتل 
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: Titles(titleName: AppMessages.drinks_1.tr)
                    ),
                    
                    products_card(
                      imgUrl: '7286556_457.png',
                      title: AppMessages.rosemaryTea.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '70.000',
                    ),
                    products_card(
                      imgUrl: 'Shdrnk1000295www.tiktarh.com_.jpg',
                      title: AppMessages.relaxingTea.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '70.000',
                    ),
                    products_card(
                      imgUrl: 'Thymes-tea2.jpg',
                      title: AppMessages.flowerTea.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '50.000',
                    ),
                   
    
                    // تایتل 
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: Titles(titleName: AppMessages.teas.tr)
                    ),
                    
                    products_card(
                      imgUrl: 'tea-2.jpg',
                      title: AppMessages.blackTea.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '80.000',
                    ),
                  
    
                    // تایتل 
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0, bottom: 10),
                      child: Titles(titleName: AppMessages.cakeTitle.tr)
                    ),
                    
                    products_card(
                      imgUrl: 'cake.jpg',
                      title: AppMessages.wetCake.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '90.000',
                    ),
                    products_card(
                      imgUrl: 'cake-1.jpg',
                      title: AppMessages.chocolateCake.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '70.000',
                    ),
                    products_card(
                      imgUrl: 'cake-2.jpg',
                      title: AppMessages.specialCake.tr,
                      desc: AppMessages.loremIpsum.tr,
                      price: '70.000',
                    ),
                  ],
                ),
          ),
        ],
      ),
    );

  }
}
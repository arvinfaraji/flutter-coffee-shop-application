import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/widgets/carousel_slider.dart';
import 'package:coffee_app/widgets/categories_card%20.dart';
import 'package:coffee_app/widgets/products_card.dart';
import 'package:coffee_app/widgets/products_card_2.dart';
import 'package:coffee_app/widgets/titles.dart';
import 'package:coffee_app/widgets/user_header.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            // ناو بار یوزر 
            UserHeader(),
        
            //  اسلایدر , جهت نمایش محصولات برای فروش فروشگاه 
             Padding(
               padding: const EdgeInsets.symmetric(vertical: 30.0),
               child: CustomCarouselSlider(),
             ),
        
            // متن و لینک دسته بندی ها 
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        Icon(Icons.list, size: 27, color: Colors.grey,),
                        Text(AppMessages.categories.tr, style: TextStyle(fontSize: 19, color: Colors.grey),)
                      ],
                    ),
      
                    
                     Text(AppMessages.seeAll.tr, style: TextStyle(fontSize: 19, color: brownColor),
                    )
                  ],
                )
              ],
            ),
    
            // باکس مدل دسته بندی ها 
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 25.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: categories_card(
                      title: AppMessages.coffees.tr,
                      icon: Icon(Icons.coffee_maker_outlined, size: 30,),
                    ),
                  ),
              
                  Expanded(
                    child: categories_card(
                      title: AppMessages.drinks_1.tr,
                      icon: Icon(Icons.coffee, size: 30,),
                    ),
                  ),
                ],
              ),
            ),
    
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: categories_card(
                    title: AppMessages.drinks_2.tr,
                    icon: Icon(Icons.local_drink, size: 30,),
                  ),
                ),
      
                Expanded(
                  child: categories_card(
                    title: AppMessages.teas.tr,
                    icon: Icon(Icons.coffee_sharp, size: 30,),
                  ),
                ),
              ],
            ),
            
            // تایتل 
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Titles(titleName: AppMessages.coffees.tr)
            ),
       
            // باکس مدل و نوع قهوه ها 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

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
              ],
            ),
    
            // تایتل 
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Titles(titleName: AppMessages.todaysOffer.tr)
            ),
           
          //  باکس پیشنهادات امروز فروشگاه
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return products_card_2();
                  },
                ),
              ),
            ),
            
            // تایتل توضیح این بخش 
            Padding(
              padding: const EdgeInsets.only(top: 60.0, bottom: 40),
              child: Column(
                spacing: 20,
                children: [
                  Row(
                    children: [
                      Flexible(child: Text(AppMessages.sellingTheDevice.tr, style: TextStyle(fontSize: 20, color: Colors.grey, fontWeight: FontWeight.bold,),))
                    ],
                  ),
    
                  // عکس مدل وسایل برای فروش فروشگاه 
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/products/Espresso-machine.webp'))),
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/products/French-press-coffee-maker.webp'))),
                    ],
                  ),
                  Row(
                    spacing: 15,
                    children: [
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/products/Mokapot-coffee-maker.webp'))),
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/products/Travel-coffee-maker.webp'))),
                    ],
                  ),
                ],
              ),
            ),
            
            // تایتل 
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Titles(titleName: AppMessages.coffees.tr)
            ),
     
            // باکس دمنوش ها 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
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
              ],
            ),
            
          ],
        ),
      ),
    );
  }
  
}



import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/cart_controller.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuyPage extends StatefulWidget {
  final String imgPath;
  final String title;
  final String price;
  const BuyPage({super.key, required this.imgPath, required this.title, required this.price});

  @override
  State<BuyPage> createState() => _BuyPageState();
}

class _BuyPageState extends State<BuyPage> {
  final CartController cartController = Get.find(); // دسترسی به کنترلر

  int entity = 1;
  late String sizes;
  String selectedSize = ''; // متغیر برای ذخیره سایز انتخاب‌شده
  // final String mainPrice = widget.price;

  late double calculatedPrice; // قیمت محاسبه‌شده

  @override
  void initState() {
    super.initState();
    calculatedPrice = double.parse(widget.price); // مقدار اولیه قیمت
  }

  void _updatePrice() {
    setState(() {
      calculatedPrice = double.parse(widget.price) * entity;
    });
  }


 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
      
          // بخش عکس
          Stack(
            children: [
             Container(
              height: MediaQuery.of(context).size.height * 0.3,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: Image.asset('assets/images/products/${widget.imgPath}').image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 10,
              right: 20,
              child: Container(
                width: 50,
                height: 50, 
                decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Colors.grey.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(50)
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back, size: 30, color: Colors.white,)
                ),
              ),
            )
           ]
          ),
          
          // بخش متن با افکت
          Transform.translate(
            offset: Offset(0, -20),
            child: Container(
              padding: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 30,
                  children: [
                    Text(
                      widget.title,
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      textAlign: Get.locale?.languageCode == 'fa' ? TextAlign.right : TextAlign.left,
                    ),
                     Text(
                      AppMessages.loremIpsum2.tr,
                      style: TextStyle(fontSize: 19, color: Colors.grey),
                      textAlign: Get.locale?.languageCode == 'fa' ? TextAlign.right : TextAlign.left,
                    ),
                
                    Text(AppMessages.pickSize.tr, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        size_card(title: 'Small',
                        isSelected: selectedSize == 'small',
                         sizeStateHandler: () {
                          setState(() {
                            selectedSize = 'small';
                          });
                         },
                        ),
                        size_card(title: 'Larg',
                        isSelected: selectedSize == 'Larg',
                        sizeStateHandler: () {
                          setState(() {
                            selectedSize = 'Larg';
                          });
                         },
                        ),
                        size_card(title: 'X Larg',
                        isSelected: selectedSize == 'X Larg',
                        sizeStateHandler: () {
                          setState(() {
                            selectedSize = 'X Larg';
                          });
                         },
                        ),
                      ],
                    ),
                
                    SizedBox(height: 10,),
                
                    Text(AppMessages.pickNum.tr, style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${calculatedPrice.toStringAsFixed(3)} ${AppMessages.toman.tr}' , style: TextStyle(
                          color: greenColor,
                          fontSize: 23,
                          fontWeight: FontWeight.w500
                        )),
                
                        Row(
                         spacing: 15,
                          children: [
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  entity++;
                                  _updatePrice();
                                });
                              },
                             child: Icon(Icons.add, size: 30,),
                           ),
                          Text(entity.toString(), style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 20.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  entity < 2 ? null : entity--;
                                  _updatePrice();
                                });
                              },
                              child: Icon(Icons.minimize, size: 30,),
                            ),
                          ),
                          ],
                        ),
                      ],
                    ),
                
                    SizedBox(height: 10,),
                    
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            if (selectedSize.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppMessages.pickSizeWarning.tr, style: TextStyle(fontSize: 19),),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                            }
      
                            cartController.addToCart(
                              widget.imgPath,
                              widget.title, 
                              selectedSize,
                              entity,
                              calculatedPrice.toStringAsFixed(3)
                            );
      
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(AppMessages.addToBasketWarning.tr, style: TextStyle(fontSize: 19),),
                                backgroundColor: Colors.green,
                              ),
                            );
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.7,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              border: Border.all(width: 2, color: brownColor),
                              borderRadius: BorderRadius.circular(40)
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 10,
                              children: [
                                Icon(Icons.shopping_cart_outlined, size: 30,),
                                Text(AppMessages.addToBasket, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ]
        ),
      ),

    );
  }
}

// ignore: camel_case_types
class size_card extends StatelessWidget {

  final String title;
  final bool isSelected;
  final VoidCallback sizeStateHandler;

  const size_card({
    super.key,
    required this.title,
    required this.isSelected,
    required this.sizeStateHandler,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: sizeStateHandler,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: brownColor),
          color: isSelected ? brownColor : Colors.transparent,
          borderRadius: BorderRadius.circular(5)
        ),
        child: Text(title, style: TextStyle(fontSize: 19, color: isSelected ? Colors.white : Colors.black),),
      ),
    );
  }
}
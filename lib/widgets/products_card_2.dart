import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/utils.dart';

// ignore: camel_case_types
class products_card_2 extends StatelessWidget {
  const products_card_2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          border: Border.all(width: 2, color: Colors.grey.withOpacity(0.3)),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 300,
              width: 250,
              child: Column(
                children: [
                  SizedBox(
                    height: 130,
                    width: double.maxFinite,
                    child: ClipRRect(borderRadius: BorderRadius.circular(5), child: Image.asset('assets/images/products/esperso.jpg')),
                  ),
                  SizedBox(height: 10,),
                  Expanded(
                    child: Column(
                      spacing: 10,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppMessages.italianCappuccino.tr,  style: TextStyle(color: brownColor, fontSize: 20, fontWeight: FontWeight.bold),),
                        Text(AppMessages.loremIpsum.tr, style: TextStyle(color: Colors.grey, fontSize: 18), softWrap: true,),
                        Text('20,000 ${AppMessages.toman.tr}', style: product_price, ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(left: 40),
                              decoration: BoxDecoration(
                                color: greenColor,
                                borderRadius: BorderRadius.circular(50)
                              ),
                              child: Icon(Icons.add, size: 22, color: Colors.white,),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
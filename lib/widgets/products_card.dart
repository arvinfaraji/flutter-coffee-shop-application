import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/screen/buy_page/buy_page.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/utilities/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class products_card extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String desc;
  final String price;

  const products_card({
    super.key, required this.imgUrl, required this.title, required this.desc, required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      padding: EdgeInsets.symmetric(vertical: 10),
      margin: EdgeInsets.symmetric(vertical: 15),
    
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Expanded(
              child: Column(
                spacing: 10,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => BuyPage(title: title, price: price, imgPath: imgUrl,)));
                    },
                    child: Text(title, style: TextStyle(color: brownColor, fontSize: 20, fontWeight: FontWeight.w500),)
                  ),
                  Text(desc, style: TextStyle(color: Colors.grey, fontSize: 18), softWrap: true,),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Row(
                      spacing: 5,
                      children: [
                        Icon(Icons.shopping_cart_outlined, size: 25, color: greenColor,),
                        Text('$price ${AppMessages.toman.tr}', style: product_price, ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
    
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: ClipRRect(borderRadius: BorderRadius.circular(10), child: Image.asset('assets/images/products/$imgUrl',)),
          ),
        ],
      ),
    );
  }
}

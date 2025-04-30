import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Map<String, dynamic>>[].obs; // لیست محصولات در سبد خرید

  void addToCart(String imgPath ,String title, String size, int quantity, String price) {
    cartItems.add({
      'img': imgPath,
      'title': title,
      'size': size,
      'quantity': quantity,
      'price': price,
    });

  }
}
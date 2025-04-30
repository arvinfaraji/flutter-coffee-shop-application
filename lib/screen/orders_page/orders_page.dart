import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/cart_controller.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:coffee_app/widgets/user_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersPage extends StatelessWidget {
  OrdersPage({super.key});
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            // ناو بار یوزر
            UserHeader(),

            // بررسی خالی بودن سبد خرید
            Obx(() {
              if (cartController.cartItems.isEmpty) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Text(
                      AppMessages.emptyBasket.tr,
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                  ),
                );
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: cartController.cartItems.length,
                  itemBuilder: (context, index) {
                    final item = cartController.cartItems[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Row(
                        spacing: 15,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // نمایش تصویر محصول
                          Container(
                            width: 100,
                            height: 100,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.grey, width: 1),
                            ),
                            child: item['img'] != null && item['img'].isNotEmpty
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: Image.asset(
                                      'assets/images/products/${item['img']}',
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : Icon(
                                    Icons.image_not_supported,
                                    color: Colors.grey,
                                    size: 50,
                                  ), // تصویر پیش‌فرض
                          ),

                          // نمایش اطلاعات محصول
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title'],
                                style: TextStyle(fontSize: 19),
                              ),
                              SizedBox(height: 5),
                              Text(
                                'سایز: ${item['size']} - تعداد: ${item['quantity']}',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${item['price']} تومان',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                  color: greenColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
// ignore_for_file: file_names
import 'package:flutter/material.dart';

// ignore: camel_case_types
class categories_card extends StatelessWidget {
  final String title;
  final Icon icon;
  
  const categories_card({
    super.key, required this.title, required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      margin: EdgeInsets.only(left: 10),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(50)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(title, style: TextStyle(fontSize: 20),)
        ], 
      ),
    );
  }
}
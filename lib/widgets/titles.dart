import 'package:flutter/material.dart';
import 'package:coffee_app/utilities/colors.dart';

class Titles extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final titleName;
  const Titles({super.key, required this.titleName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        textDirection: TextDirection.rtl,
        children: [
          Text(
            titleName,
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.width * 0.050,
              color: brownColor,
            ),
          ),
          SizedBox(
            width: 13,
          ),
          Expanded(
            child: Container(
              height: 1,
              color: brownColor,
            ),
          ),
        ],
      ),
    );
  }
}

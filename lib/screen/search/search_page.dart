import 'package:coffee_app/Core/I18n/messages.dart';
import 'package:coffee_app/utilities/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          spacing: 25,
          children: [
            Row(
              spacing: 10,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back, color: brownColor),
                ),
                    
                Expanded(
                  child: TextField(
                    cursorHeight: 20,
                    cursorColor: greenColor,
                    showCursor: true,
                    textAlign: TextAlign.start,
                    autofocus: true,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 106, 105, 105),
                      fontSize: 18,
                    ),
                    decoration: InputDecoration(
                      hintText: AppMessages.searchTitle.tr,
                      hintStyle: const TextStyle(
                        fontSize: 19,
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
        
            Divider(height: 2, color: Colors.grey),
        
            Row(
              children: [
                const Icon(Icons.history, size: 30, color: Colors.grey),
                const SizedBox(width: 15),
                Text(
                  AppMessages.singleArabica.tr,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.arrow_up_left, color: brownColor),
              ],
            ),
        
            Row(
              children: [
                const Icon(Icons.history, size: 30, color: Colors.grey),
                const SizedBox(width: 15),
                Text(
                  AppMessages.singleHundred.tr,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.arrow_up_left, color: brownColor),
              ],
            ),
        
            Row(
              children: [
                const Icon(Icons.history, size: 30, color: Colors.grey),
                const SizedBox(width: 15),
                Text(
                  AppMessages.chocolateCake.tr,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                const Spacer(),
                const Icon(CupertinoIcons.arrow_up_left, color: brownColor),
              ],
            ),
        
        
            Spacer(),
      
            Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.symmetric(vertical: 12),
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: greenColor,
                borderRadius: BorderRadius.circular(50)
              ),
              child: Row(
                spacing: 8,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search, size: 25, color: Colors.white,),
                  Text(AppMessages.search.tr, style: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.w500),),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

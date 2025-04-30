import 'package:coffee_app/utilities/colors.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CustomCarouselSlider extends StatefulWidget {
  const CustomCarouselSlider({super.key});

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();
}

  List<String> carouselItems = [
    'assets/images/products/Arabica-coffee.webp',
    'assets/images/products/Blended-coffee.webp',
    'assets/images/products/High-caffeine-coffee.webp',
    'assets/images/products/Robusta-coffee.webp',
  ];

  int selected = 0;

class _CustomCarouselSliderState extends State<CustomCarouselSlider> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: carouselItems.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                carouselItems[index],
                fit: BoxFit.cover,
              ),
            );
          },
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() {
                selected = index;
              });
            },
            height: 250.0,
            aspectRatio: 16 / 9,
            autoPlayCurve: Curves.fastOutSlowIn,
            enableInfiniteScroll: true,
            enlargeCenterPage: true,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 2),
            autoPlayInterval: const Duration(seconds: 5),
            viewportFraction: 1,
          ),
        ),
        Positioned(
          left: 20,
          bottom: 30,
          child: Row(
            children: List.generate(
              carouselItems.length,
              (index) {
                return index == selected
                    ? AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        width: 18,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          color: brownColor,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      )
                    : AnimatedContainer(
                        duration: const Duration(milliseconds: 350),
                        width: 8,
                        height: 8,
                        margin: const EdgeInsets.only(right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
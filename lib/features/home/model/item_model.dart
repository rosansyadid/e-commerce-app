
import 'package:flutter/material.dart';

class ItemFoodModel{
  final String imagePath;
  final String name;
  final String calories;
  final String description;
  Color? bgColor = Color(0xffFFFFFF);

  ItemFoodModel({
    required this.imagePath,
    required this.name,
    required this.calories,
    required this.description,
    this.bgColor
  });
}
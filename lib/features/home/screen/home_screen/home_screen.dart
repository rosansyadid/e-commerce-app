// Lokasi: lib/features/home/screens/home_screen.dart

import 'package:flutter/material.dart';
import 'package:ecommerce_mobile/features/home/model/item_model.dart';
import '../detail_screen/detail_screen.dart'; // Pastikan path detail screen Anda benar

part '../home_screen/sections/header_section.dart';
part '../home_screen/sections/food_list_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // --- DATA DUMMY ---
  final List<ItemFoodModel> newRecommendations = [
    ItemFoodModel(
      imagePath: 'assets/images/food.png',
      name: 'Baked Salmon & Asparagus',
      calories: '190 kcal',
      description: 'A healthy and delicious meal...',
    ),
    ItemFoodModel(
      imagePath: 'assets/images/food.png',
      name: 'Vegetable Mix',
      calories: '260 kcal',
      description: 'A colorful mix of fresh vegetables...',
    ),
  ];

  final List<ItemFoodModel> popularFoods = [
    ItemFoodModel(
      imagePath: 'assets/images/food.png',
      name: 'Seasonal Salad',
      calories: '120 kcal',
      description: 'A light salad with seasonal ingredients...',
    ),
    ItemFoodModel(
      imagePath: 'assets/images/food.png',
      name: 'Rainbow Bowl',
      calories: '310 kcal',
      description: 'A vibrant and filling bowl...',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:10.0, vertical: 16),
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {},
          ),
          title: const Text(
            'Home',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.more_vert, color: Colors.black),
              onPressed: () {},
            ),
          ],
        ),
        // Kita gunakan SingleChildScrollView agar lebih aman dari overflow jika ada banyak item
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- BAGIAN SEARCH BAR ---
              SearchBar(),
              const SizedBox(height: 24),
      
              // --- BAGIAN BANNER ---
              BannerPart(),
              const SizedBox(height: 32),
      
              // --- BAGIAN NEW RECOMMENDATION ---
              const Text(
                'New Recommendation',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              NewRecomendation(newRecommendations: newRecommendations),
              const SizedBox(height: 32),
      
              // --- BAGIAN POPULAR FOOD ---
              const Text(
                'Popular Food',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              PopularFood(popularFoods: popularFoods),
            ],
          ),
        ),
      ),
    );
  }
}

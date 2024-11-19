import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uts_feelty/gnavbar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NutritionPage(),
    );
  }
}

class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.white38,
        elevation: 0,
        title: const Text('Nutrition', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: const Icon(Icons.arrow_back, color: Colors.black),
        actions: const [
          Icon(Icons.water_drop, color: Colors.black),
          SizedBox(width: 16),
          Icon(Icons.bookmark, color: Colors.black),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Date Selector
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(7, (index) {
                  return DateButton(
                    day: (16 + index).toString(),
                    isSelected: index == 2,
                  );
                }),
              ),
              const SizedBox(height: 10),
              // Search bar and filters
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.grey[200],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const FilterButton(icon: Icons.coffee, label: 'Food'),
                  const FilterButton(icon: Icons.local_drink, label: 'Drink'),
                ],
              ),
              const SizedBox(height: 10),
              // Food and Drink Tabs
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ToggleButton(label: 'Food', isActive: true),
                  SizedBox(width: 10),
                  ToggleButton(label: 'Drink', isActive: false),
                ],
              ),
              const SizedBox(height: 20),
              // Meals List
              MealSection(title: 'Breakfast', meals: breakfastMeals),
              MealSection(title: 'Lunch', meals: lunchMeals),
              MealSection(title: 'Dinner', meals: dinnerMeals),
              MealSection(title: 'Snack', meals: snackMeals),
              const SizedBox(height: 20),
              // Articles section
              const Text(
                'Articles for you',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: _buildArticleCard('How to reduce stress in workout',
                        'assets/icons/Artikel1.svg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildArticleCard('How to manage weight in 2 weeks',
                        'assets/images/Artikel2.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildArticleCard(String title, String assetPath) {
    bool isSvg = assetPath.endsWith('.svg');
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 1, color: Colors.grey),
          borderRadius: BorderRadius.circular(15)),
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          isSvg
              ? SvgPicture.asset(
                  assetPath, // Untuk SVG
                  width: 120,
                  height: 120,
                )
              : Image.asset(
                  assetPath, // Untuk gambar biasa
                  width: 120,
                  height: 120,
                ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12), color: Colors.orange),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class DateButton extends StatelessWidget {
  final String day;
  final bool isSelected;

  const DateButton({super.key, required this.day, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        day,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const FilterButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.black),
          const SizedBox(width: 4),
          Text(label, style: const TextStyle(color: Colors.black)),
        ],
      ),
    );
  }
}

class ToggleButton extends StatelessWidget {
  final String label;
  final bool isActive;

  const ToggleButton({super.key, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.orange : Colors.grey[200],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class MealSection extends StatelessWidget {
  final String title;
  final List<Meal> meals;

  const MealSection({super.key, required this.title, required this.meals});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: meals
              .map((meal) => MealCard(
                  title: meal.title,
                  calories: meal.calories,
                  imageUrl: meal.imageUrl))
              .toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class MealCard extends StatelessWidget {
  final String title;
  final String calories;
  final String imageUrl;

  const MealCard(
      {super.key,
      required this.title,
      required this.calories,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: const CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(
            'https://www.jessicagavin.com/wp-content/uploads/2018/04/tofu-scramble-9.jpg'), // Replace with actual image
      ),
      title: Text(title),
      subtitle: Text('$calories kcal'),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
    );
  }
}

class ArticleCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const ArticleCard({super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(imageUrl, width: 100, height: 100, fit: BoxFit.cover),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}

// Sample meal data
class Meal {
  final String title;
  final String calories;
  final String imageUrl;

  Meal({required this.title, required this.calories, required this.imageUrl});
}

final breakfastMeals = [
  Meal(
      title: 'Tofu Scrambled',
      calories: '320 kcal',
      imageUrl:
          'https://www.jessicagavin.com/wp-content/uploads/2018/04/tofu-scramble-9.jpg'),
  Meal(
      title: 'Oat and Pear Porridge',
      calories: '280 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
];

final lunchMeals = [
  Meal(
      title: 'Curry Rice',
      calories: '350 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
  Meal(
      title: 'Rice with Spinach',
      calories: '300 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
];

final dinnerMeals = [
  Meal(
      title: 'Special Fried Rice',
      calories: '420 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
  Meal(
      title: 'Chinese Noodles',
      calories: '390 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
];

final snackMeals = [
  Meal(
      title: 'Vegan Choco Cookies',
      calories: '200 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
  Meal(
      title: 'Apple Sponge Cake',
      calories: '240 kcal',
      imageUrl: 'https://via.placeholder.com/150'),
];

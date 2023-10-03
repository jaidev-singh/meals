import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';
import 'package:meals/models/meal.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  final void Function(Meal meal) onToggleFavorite;
  const CategoriesScreen({
    super.key,
    required this.onToggleFavorite,
    required this.availabelMeals,
  });
  final List<Meal> availabelMeals;

  void _selectCategory(BuildContext context, Category category) {
    final filteredMeals = availabelMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
            title: category.title,
            meals: filteredMeals,
            onToggleFavorite: onToggleFavorite),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(24),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // no. of columns
        childAspectRatio: 3 / 2, // ratio of length to height
        crossAxisSpacing: 20, // space between the columns
        mainAxisSpacing: 20, // space between rows
      ),
      children: [
        //availableCategories.map((category)=>CategoryGridItem(category:category)).toList()
        for (final category in availableCategories)
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectCategory(context, category);
            },
          )
      ],
    );
  }
}

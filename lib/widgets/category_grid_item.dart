import 'package:flutter/material.dart';

import 'package:meals/models/category.dart';

class CategoryGridItem extends StatelessWidget {
  final Category category;
  final void Function() onSelectCategory;

  const CategoryGridItem(
      {super.key, required this.category, required this.onSelectCategory});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // can define styles on it, GestureDectector don't support style
      onTap: onSelectCategory,
      splashColor: Theme.of(context).primaryColor,

      child: Container(
        padding: const EdgeInsets.all(16.0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              category.color.withOpacity(.55),
              category.color.withOpacity(.99),
            ],
          ),
        ),
        child: Text(
          textAlign: TextAlign.center,
          category.title,
          style: Theme.of(context)
              .textTheme
              .titleLarge
              ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
        ),
      ),
    );
  }
}

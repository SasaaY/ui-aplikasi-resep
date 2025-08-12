import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_asset;

enum RecipeCategory {
  appetizer,
  mainCourse,
  dessert,
  cake,
  all;

  String get label {
    switch (this) {
      case RecipeCategory.appetizer:
        return 'Appetizer';
      case RecipeCategory.mainCourse:
        return 'Main Course';
      case RecipeCategory.dessert:
        return 'Dessert';
      case RecipeCategory.cake:
        return 'Cake';
      case RecipeCategory.all:
        return 'All';
    }
  }
}

class RecipeModel {
  UniqueKey? id = UniqueKey();
  String title, image;
  List<String> ingredients;
  List<String> steps;
  RecipeCategory category;

  RecipeModel({
    this.id,
    this.title = "",
    this.image = "",
    this.ingredients = const [],
    this.steps = const [],
    this.category = RecipeCategory.appetizer,
  });

  static List<RecipeModel> recipes = [
    RecipeModel(
      title: "Sate Ayam",
      image: app_asset.sate,
      ingredients: ["1. ayam", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: RecipeCategory.appetizer,
    ),
    RecipeModel(
      title: "Sate Kambing",
      image: app_asset.sate,
      ingredients: ["1. kambing", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: RecipeCategory.dessert,
    ),
    RecipeModel(
      title: "Sate Sapi",
      image: app_asset.sate,
      ingredients: ["1. sapi", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: RecipeCategory.appetizer,
    ),
  ];

  // static List<String> get categories {
  //   return recipes.map((e) => e.category).toSet().toList();
  // }

  static List<RecipeModel> getByCategory(RecipeCategory category) {
    return recipes.where((recipe) => recipe.category == category).toList();
  }
}

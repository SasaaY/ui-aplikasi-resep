import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_asset;

class RecipeModel {
  UniqueKey? id = UniqueKey();
  String title, image;
  List<String> ingredients;
  List<String> steps;
  String category;

  RecipeModel({
    this.id,
    this.title = "",
    this.image = "",
    this.ingredients = const [],
    this.steps = const [],
    this.category = "",
  });

  static List<RecipeModel> recipes = [
    RecipeModel(
      title: "Sate Ayam",
      image: app_asset.sate,
      ingredients: ["1. ayam", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: "Appetizer",
    ),
  ];

  static List<String> get categories {
    return recipes.map((e) => e.category).toSet().toList();
  }

  static List<RecipeModel> getByCategory(String category) {
    return recipes.where((recipe) => recipe.category == category).toList();
  }
}

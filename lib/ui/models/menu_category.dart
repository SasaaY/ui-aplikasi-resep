import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_assets;
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';

class MenuCategoryModel {
  UniqueKey? id = UniqueKey();
  RecipeCategory title;
  String image;

  MenuCategoryModel({
    this.id,
    this.title = RecipeCategory.appetizer,
    this.image = "",
  });

  static List<MenuCategoryModel> category = [
    MenuCategoryModel(title: RecipeCategory.appetizer, image: app_assets.sate),
    MenuCategoryModel(title: RecipeCategory.mainCourse, image: app_assets.sate),
    MenuCategoryModel(title: RecipeCategory.dessert, image: app_assets.sate),
    MenuCategoryModel(title: RecipeCategory.cake, image: app_assets.sate),
  ];
}

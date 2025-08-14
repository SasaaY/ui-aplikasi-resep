import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_asset;

enum RecipeCategory {
  appetizer,
  mainCourse,
  dessert,
  cake;

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
    }
  }
}

class RecipeModel {
  UniqueKey? id = UniqueKey();
  String title, image;
  List<String> ingredients;
  List<String> steps;
  RecipeCategory category;
  bool isBookmarked;

  RecipeModel({
    required this.id,
    this.title = "",
    this.image = "",
    this.ingredients = const [],
    this.steps = const [],
    this.category = RecipeCategory.appetizer,
    this.isBookmarked = false,
  });

  static List<RecipeModel> recipes = [
    RecipeModel(
      id: UniqueKey(),
      title: "Sate Ayam",
      image: app_asset.sate,
      ingredients: ["1. ayam", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan", "- minum"],
      category: RecipeCategory.appetizer,
      isBookmarked: false,
    ),
    RecipeModel(
      id: UniqueKey(),
      title: "Sate Kambing",
      image: app_asset.sate,
      ingredients: ["1. kambing", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: RecipeCategory.dessert,
      isBookmarked: false,
    ),
    RecipeModel(
      id: UniqueKey(),
      title: "Sate Sapi",
      image: app_asset.sate,
      ingredients: ["1. sapi", "2. kacang", "3. kecap"],
      steps: ["- bakar", "- tusuk", "- makan"],
      category: RecipeCategory.cake,
      isBookmarked: false,
    ),
    RecipeModel(
      id: UniqueKey(),
      title: "Wonton Chili Oil",
      image: app_asset.wonton,
      ingredients: [
        "150 lembar Kulit pangsit tipis",
        "2 kg ayam fillet",
        "1 kg udang",
        "2 kg sawi putih",
        "100 gr sagu",
        "5 sdm saos tiram",
        "1 sdm merica bubuk",
        "3 sdm bawang putih bubuk",
        "Secukupnya garam",
        "Secukupnya gula pasir",
      ],
      steps: [
        "1.	Choper fillet daging ayam dan udang hingga halus, masukkan semua bahan aduk rata. Rajang tipis sawi putih lalu rebus sebentar dan tiriskan, peras rebusan sawi hingga tidak ada airnya, kemudian campurkan ke adonan ayam hingga rata. Icip hingga sesuai selera. Masukkan adonan ke dalam frezeer minimal 1 jam agar adonan lebih set",
        "2.	Setelah adonan set, siapkan kulit pangsit yang tipis, ambil 1 sdm adonan lalu masukkan ke tengah tengah kulit pangsit kemudian bentuk, lem menggunakan air",
        "3.	Adonan yang sudah dibentuk bisa di simpan dalam frezeer, rebus dalam air mendidih hingga mengambang, angkat lalu tiriskan.",
        "4.	Siapkan chili oilnya campur saos cabai dan kecap aduk rata, lalu icip bumbu nya agar sesuai selera",
        "5.	Masukkan rebusan wonton dalam mangkuk saosnya aduk rata, beri potongan daun bawang dan siap",
      ],
      category: RecipeCategory.cake,
      isBookmarked: false,
    ),
  ];

  // static List<String> get categories {
  //   return recipes.map((e) => e.category).toSet().toList();
  // }

  static List<RecipeModel> getByCategory(RecipeCategory category) {
    return recipes.where((recipe) => recipe.category == category).toList();
  }
}

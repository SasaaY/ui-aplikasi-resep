import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/menu_category_button.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_category.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RecipeCategory selectedCategory = RecipeCategory.all;

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> displayedRecipes = selectedCategory == 'All'
        ? RecipeModel.recipes
        : RecipeModel.getByCategory(selectedCategory);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'L\'Atelier du Chef',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              'BENGKELSI KOKI',
              style: TextStyle(fontSize: 12, color: Colors.black54),
            ),
          ],
        ),
        actions: [
          IconButton(icon: const Icon(Icons.add), onPressed: () {}),
          IconButton(icon: const Icon(Icons.menu), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Cari Resep...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Wrap(
              spacing: 12,
              children: [
                ...MenuCategoryModel.category.map(
                  (category) => MenuCategoryButton(
                    category: category,
                    onCategorySelected: (category) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Recommended Recipe',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextButton(onPressed: () {}, child: const Text('See All')),
              ],
            ),
          ),
          Expanded(
            child: displayedRecipes.isEmpty
                ? const Center(child: Text('No recipes available'))
                : GridView.builder(
                    padding: const EdgeInsets.all(8.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: displayedRecipes.length,
                    itemBuilder: (context, index) {
                      return FoodCard(recipe: displayedRecipes[index]);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

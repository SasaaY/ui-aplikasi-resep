import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/menu_category_button.dart';
import 'package:ui_rplikasi_resep_masakan/ui/getstart.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_category.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/opsi_menu.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/bookmark_recipe.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/profile_screen.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/settings.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/tambah_recipe.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  RecipeCategory? _selectedCategory;

  void _handleCategory(RecipeCategory newCategory) {
    setState(() {
      _selectedCategory = (_selectedCategory == newCategory)
          ? null
          : newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> displayedRecipes = _selectedCategory == null
        ? RecipeModel.recipes
        : RecipeModel.getByCategory(_selectedCategory!);

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
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AddRecipeScreen()),
              );
              if (result == true) {
                setState(() {}); // Refresh list setelah kembali
              }
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu),
            onSelected: (value) {
              switch (value) {
                case 'profile':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ProfileScreen()),
                  );
                  break;
                case 'bookmark':
                  // 
                  break;
                case 'notification':
                  // Navigasi ke halaman notifikasi
                  break;
                case 'settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingsScreen()),
                  );
                  break;
                case 'exit':
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Getstart()),
                  );
                  break;
              }
            },
            itemBuilder: (BuildContext context) {
              return OpsiMenu.opsiMenu.map((opsi) {
                return PopupMenuItem<String>(
                  value: opsi.value,
                  child: ListTile(
                    leading: Icon(opsi.icon),
                    title: Text(opsi.title),
                  ),
                );
              }).toList();
            },
          ),
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
                ...MenuCategoryModel.category
                    .where((category) {
                      return _selectedCategory == null ||
                          category.title == _selectedCategory;
                    })
                    .map(
                      (category) => MenuCategoryButton(
                        category: category,
                        selectedCategory: _selectedCategory,
                        onCategorySelected: _handleCategory,
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
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'See All',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
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

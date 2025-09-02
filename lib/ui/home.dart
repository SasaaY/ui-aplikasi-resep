import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/menu_category_button.dart';
import 'package:ui_rplikasi_resep_masakan/ui/getstart.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_category.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/opsi_menu.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/bookmark_recipe.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/notification_page.dart';
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
  List<RecipeModel> bookmarkedRecipes = [];

  void _toggleBookmark(RecipeModel recipe) {
    setState(() {
      if (bookmarkedRecipes.any((r) => r.id == recipe.id)) {
        bookmarkedRecipes.removeWhere((r) => r.id == recipe.id);
      } else {
        bookmarkedRecipes.add(recipe);
      }
    });
  }

  bool _isBookmarked(RecipeModel recipe) {
    return bookmarkedRecipes.any((r) => r.id == recipe.id);
  }

  void _handleCategory(RecipeCategory newCategory) {
    setState(() {
      _selectedCategory =
          (_selectedCategory == newCategory) ? null : newCategory;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<RecipeModel> displayedRecipes = _selectedCategory == null
        ? RecipeModel.recipes
        : RecipeModel.getByCategory(_selectedCategory!);

    return Scaffold(
      extendBodyBehindAppBar: true, // biar gradient sampai ke atas
      appBar: AppBar(
        backgroundColor: Colors.transparent, // transparan
        elevation: 0,
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
                setState(() {});
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BookmarkPage(
                        bookmarks: bookmarkedRecipes,
                        onRemoves: (recipe) {
                          setState(() {
                            bookmarkedRecipes.removeWhere(
                                (r) => r.id == recipe.id);
                          });
                        },
                      ),
                    ),
                  );
                  break;
                  case 'notification':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const NotificationPage()),
                  );
                  break;
                case 'settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                  break;
                case 'exit':
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const Getstart()),
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
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFA5D6A7), // hijau muda (bisa disesuaikan)
              Colors.white,      // putih bawah
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Search Box
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
              // Category
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Wrap(
                  spacing: 12,
                  children: [
                    ...MenuCategoryModel.category.map(
                      (category) => MenuCategoryButton(
                        category: category,
                        selectedCategory: _selectedCategory,
                        onCategorySelected: _handleCategory,
                      ),
                    ),
                    const SizedBox(width: 20),
                  ],
                ),
              ),
              // Recommended Title
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recommended Recipe',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
              // Recipe Grid
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
                          final recipe = displayedRecipes[index];
                          return FoodCard(
                            recipe: recipe,
                            isBookmarked: _isBookmarked(recipe),
                            onBookmarkToggle: () => _toggleBookmark(recipe),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

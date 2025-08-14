import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_assets;

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Contoh resep yang dibuat oleh user ini
    final myRecipes = RecipeModel.recipes.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Header Profil
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage(
                    app_assets.sate,
                  ), // Ganti dengan gambar pengguna
                ),
                const SizedBox(width: 16),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Melani Eka',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('@melani_eka', style: TextStyle(color: Colors.grey)),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Statistik
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatColumn('4', 'Postingan'),
                _buildStatColumn('140', 'Suka'),
              ],
            ),
            const SizedBox(height: 20),

            // Tombol Aksi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Edit Profil'),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: const Text('Bagikan Profil'),
                ),
              ],
            ),
            const SizedBox(height: 30),

            // Grid Resep
            const Text(
              'Resep Saya',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: myRecipes.length,
              itemBuilder: (context, index) {
                return FoodCard(
                  recipe: myRecipes[index],
                  isBookmarked: false,
                  onBookmarkToggle: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

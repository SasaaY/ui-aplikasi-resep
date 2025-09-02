import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_assets;
import 'package:ui_rplikasi_resep_masakan/ui/screens/edit_profil.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = "Melani Eka";
  String username = "@melani_eka";

  @override
  Widget build(BuildContext context) {
    final myRecipes = RecipeModel.recipes.take(4).toList();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text("Kembali", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // ===== Header Profile =====
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFFA5D6A7), Colors.white],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(app_assets.sate),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(username, style: const TextStyle(color: Colors.black54)),
                  const SizedBox(height: 16),

                  // Statistik
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildStatColumn('4', 'Postingan'),
                      const SizedBox(width: 40),
                      _buildStatColumn('140', 'Suka'),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Tombol aksi
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const EditProfilePage()),
                          );

                          if (result != null) {
                            setState(() {
                              name = result["name"];
                              username = result["username"];
                            });
                          }
                        },
                        child: const Text('Edit Profil'),
                      ),
                      const SizedBox(width: 12),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text('Bagikan Profil'),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // ===== Grid Resep =====
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Resep Saya",
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.75,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
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
          ],
        ),
      ),
    );
  }

  static Widget _buildStatColumn(String value, String label) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.black54)),
      ],
    );
  }
}

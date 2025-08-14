import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/screens/detail_recipe_page.dart';

class FoodCard extends StatelessWidget {
  final RecipeModel recipe;
  final bool isBookmarked;
  final VoidCallback onBookmarkToggle;

  const FoodCard({
    super.key,
    required this.recipe,
    required this.isBookmarked,
    required this.onBookmarkToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailRecipePage(recipe: recipe),
            ),
          );
        },
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(10),
                ),
                child: Image.asset(recipe.image, fit: BoxFit.cover),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      recipe.title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.green,
                    ),
                    onPressed: onBookmarkToggle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

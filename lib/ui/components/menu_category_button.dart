import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/menu_category.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';

class MenuCategoryButton extends StatefulWidget {
  final MenuCategoryModel category;
  final Function(RecipeCategory) onCategorySelected;

  const MenuCategoryButton({
    Key? key,
    required this.category,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  State<MenuCategoryButton> createState() => _MenuCategoryButtonState();
}

class _MenuCategoryButtonState extends State<MenuCategoryButton> {
  bool _isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _isSelected = !_isSelected;
        });
        widget.onCategorySelected(widget.category.title);
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        elevation: 2,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: Image.asset(
              widget.category.image,
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 12),
          Text(
            widget.category.title.label,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            semanticsLabel: widget.category.title.label,
          ),
        ],
      ),
    );
  }
}

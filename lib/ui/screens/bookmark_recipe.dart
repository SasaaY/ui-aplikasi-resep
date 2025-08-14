import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/components/food_card.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';

class BookmarkPage extends StatefulWidget {
  final List<RecipeModel> bookmarks;
  final Function(RecipeModel) onRemoves;

  const BookmarkPage({
    Key? key,
    this.bookmarks = const [],
    required this.onRemoves,
  }) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  late List<RecipeModel> _list;

  @override
  void initState() {
    super.initState();
    _list = List.from(widget.bookmarks);
  }

  void _toggleBookmark(RecipeModel recipe) {
    setState(() {
      if (_list.contains(recipe)) {
        _list.remove(recipe);
        widget.onRemoves(recipe);
      } else {
        _list.add(recipe);
      }
    });
  }

  bool _isBookmarked(RecipeModel recipe) => _list.contains(recipe);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Penanda Buku')),
      body: _list.isEmpty
          ? const Center(child: Text('Belum ada resep yang di-bookmark.'))
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
              ),
              itemCount: _list.length,
              itemBuilder: (_, i) {
                final recipe = _list[i];
                return FoodCard(
                  recipe: recipe,
                  isBookmarked: _isBookmarked(recipe),
                  onBookmarkToggle: () => _toggleBookmark(recipe),
                );
              },
            ),
    );
  }
}

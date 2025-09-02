import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/ui/models/recipe_model.dart';
import 'package:ui_rplikasi_resep_masakan/ui/assets.dart' as app_asset;

class AddRecipeScreen extends StatefulWidget {
  const AddRecipeScreen({Key? key}) : super(key: key);

  @override
  State<AddRecipeScreen> createState() => _AddRecipeScreenState();
}

class _AddRecipeScreenState extends State<AddRecipeScreen> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _imageController = TextEditingController();
  final _ingredientsController = TextEditingController();
  final _stepsController = TextEditingController();

  RecipeCategory _selectedCategory = RecipeCategory.appetizer;

  @override
  void dispose() {
    _titleController.dispose();
    _imageController.dispose();
    _ingredientsController.dispose();
    _stepsController.dispose();
    super.dispose();
  }

  void _saveRecipe() {
    if (_formKey.currentState!.validate()) {
      final newRecipe = RecipeModel(
        id: UniqueKey(),
        title: _titleController.text.trim(),
        image: _imageController.text.trim().isEmpty
            ? app_asset.sate // default image
            : _imageController.text.trim(),
        ingredients: _ingredientsController.text
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
        steps: _stepsController.text
            .split('\n')
            .map((e) => e.trim())
            .where((e) => e.isNotEmpty)
            .toList(),
        category: _selectedCategory,
      );

      RecipeModel.recipes.add(newRecipe);
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tambah Resep Baru'),
        centerTitle: true,
        // kasih gradient
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFFA5D6A7), // hijau muda
                Colors.white, // nyatu ke background
              ],
            ),
          ),
        ),
        elevation: 0, // biar halus nyambung
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Judul Resep'),
                validator: (val) =>
                    val!.trim().isEmpty ? 'Judul tidak boleh kosong' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _imageController,
                decoration: const InputDecoration(
                  labelText: 'URL Gambar (biarkan kosong untuk default)',
                  hintText: 'https://contoh.com/gambar.jpg',
                ),
              ),
              const SizedBox(height: 12),
              DropdownButtonFormField<RecipeCategory>(
                value: _selectedCategory,
                decoration: const InputDecoration(labelText: 'Kategori'),
                items: RecipeCategory.values
                    .map(
                      (e) => DropdownMenuItem(value: e, child: Text(e.label)),
                    )
                    .toList(),
                onChanged: (val) => setState(() => _selectedCategory = val!),
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _ingredientsController,
                maxLines: 4,
                decoration: const InputDecoration(
                  labelText: 'Bahan-bahan',
                  hintText: 'Masukkan setiap bahan di baris baru',
                ),
                validator: (val) => val!.trim().isEmpty
                    ? 'Daftar bahan tidak boleh kosong'
                    : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _stepsController,
                maxLines: 6,
                decoration: const InputDecoration(
                  labelText: 'Langkah-langkah',
                  hintText: 'Masukkan setiap langkah di baris baru',
                ),
                validator: (val) =>
                    val!.trim().isEmpty ? 'Langkah tidak boleh kosong' : null,
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFA5D6A7),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  onPressed: _saveRecipe,
                  child: const Text(
                    'Simpan Resep',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

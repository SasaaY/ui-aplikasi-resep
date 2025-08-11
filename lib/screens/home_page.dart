import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/constants/colors.dart';
import 'package:ui_rplikasi_resep_masakan/screens/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<bool> _isSelected = [true, false, false];
  List<Container> daftarMakanan = [];
  var itemMakanan = [
    {
      "nama": "Salad Sayur",
      "gambar": "sate.png",
      "category": "Appetizer",
      "bahan": [
        "- 2 Buah Alpukat",
        "- 1 Ikat Sayur Selada",
        "- 2 Buah Tomat",
        "- 1 Buah Timun",
        "- 1/4 Buah Paprika Kuning dan Merah",
        "- 200ml Greek Yoghurt Classic",
        "- 4 Sdm Mayones",
        "- 1 Sachet Kental Manis",
        "- 2 Sdm Madu",
        "- 1 Buah Jeruk Lemon",
        "- 1 Sdt Parutan Kulit Jeruk Lemon",
        "- Sejumput Parsley Kering",
      ],
      "langkah": [
        "1. Cuci bersih semua sayuran dan potong sesuai selera.",
        "2. Campurkan Greek Yoghurt, Mayones, Kental Manis, dan Madu dalam mangkuk, aduk hingga merata.",
        "3. Tambahkan perasan jeruk lemon dan parutan kulit jeruk lemon, aduk lagi.",
        "4. Masukkan sayuran yang sudah dipotong ke dalam campuran saus, aduk hingga tercampur sempurna.",
        "5. Taburkan parsley kering di atasnya sebagai hiasan.",
        "6. Sajikan dingin.",
      ],
    },
    {
      "nama": "Soto Lamongan",
      "gambar": "soto.jpg",
      "category": "Main Course",
      "bahan": [
        "- 500g Daging Sapi",
        "- 2 Liter Air",
        "- 3 Siung Bawang Putih",
      ],
      "langkah": [
        "1. Rebus daging hingga empuk.",
        "2. Tumis bumbu, lalu masukkan ke dalam kuah.",
      ],
    },
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _buatDataListMakanan();
  }

  void _buatDataListMakanan() {
    for (var i = 0; i < itemMakanan.length; i++) {
      final dataMakanan = itemMakanan[i];
      final String? gambarMakanan = dataMakanan['gambar'] as String?;
      final String? namaMakanan = dataMakanan['nama'] as String?;

      daftarMakanan.add(
        Container(
          padding: const EdgeInsets.all(10),
          child: RecipeCard(
            title: namaMakanan!,
            imagePath: 'assets/$gambarMakanan',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    nama: namaMakanan,
                    gambar: gambarMakanan!,
                    bahan: dataMakanan['bahan'] as List<String>,
                    langkah: dataMakanan['langkah'] as List<String>,
                  ),
                ),
              );
            },
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String selectedCategory = _isSelected[0]
        ? 'Appetizer'
        : _isSelected[1]
        ? 'Main Course'
        : 'Dessert';
    List<Container> filteredRecipes = daftarMakanan.where((container) {
      var data = itemMakanan[daftarMakanan.indexOf(container)];
      return data['category'] == selectedCategory;
    }).toList();

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.lightGreen.withOpacity(0.5), AppColors.white],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'L\'Atelier du Chef',
                    style: TextStyle(color: AppColors.darkGreen),
                  ),
                  Text(
                    'BENGKELSI KOKI',
                    style: TextStyle(color: AppColors.darkGreen, fontSize: 12),
                  ),
                ],
              ),
              backgroundColor: AppColors.lightGreen.withOpacity(0.5),
              actions: [
                IconButton(
                  icon: Icon(Icons.add, color: AppColors.darkGreen),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.menu, color: AppColors.darkGreen),
                  onPressed: () {},
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Resep...',
                  hintStyle: TextStyle(color: AppColors.mediumGray),
                  prefixIcon: Icon(Icons.search, color: AppColors.mediumGray),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.mediumGray),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: AppColors.darkGreen),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CategoryButton(
                    title: 'Appetizer',
                    imagePath: 'assets/sate.png',
                    isSelected: _isSelected[0],
                    onPressed: () => setState(() {
                      for (var i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = false;
                      }
                      _isSelected[0] = true;
                    }),
                  ),
                  CategoryButton(
                    title: 'Main Course',
                    imagePath: 'assets/sate.png',
                    isSelected: _isSelected[1],
                    onPressed: () => setState(() {
                      for (var i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = false;
                      }
                      _isSelected[1] = true;
                    }),
                  ),
                  CategoryButton(
                    title: 'Dessert',
                    imagePath: 'assets/sate.png',
                    isSelected: _isSelected[2],
                    onPressed: () => setState(() {
                      for (var i = 0; i < _isSelected.length; i++) {
                        _isSelected[i] = false;
                      }
                      _isSelected[2] = true;
                    }),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  children: filteredRecipes,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  final String title;
  final String imagePath;
  final bool isSelected;
  final VoidCallback onPressed;

  const CategoryButton({
    super.key,
    required this.title,
    required this.imagePath,
    required this.isSelected,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.lightGreen
            : AppColors.lightGreen.withOpacity(0.5),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(imagePath, height: 30, width: 30, fit: BoxFit.cover),
          SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(color: AppColors.darkGreen, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  const RecipeCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.contain,
                    width: double.infinity,
                    height: 80,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.darkGreen,
                      ),
                    ),
                    SizedBox(width: 5),
                    Icon(Icons.bookmark, color: AppColors.darkGreen, size: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

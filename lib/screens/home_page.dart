import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFFABDCB4), Colors.white],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: 'L’Atelier du Chef\n',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFF02470E),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 5),
                              blurRadius: 5,
                              color: Color(0xFF000000).withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                      TextSpan(
                        text: 'BENGKEL SI KOKI',
                        style: GoogleFonts.ubuntu(
                          color: const Color(0xFF02470E),
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          shadows: [
                            Shadow(
                              offset: Offset(0, 5),
                              blurRadius: 5,
                              color: Color(0xFF000000).withOpacity(0.25),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Cari Resep...',
                    prefixIcon: Container(
                      width: 25,
                      height: 24,
                      margin: const EdgeInsets.only(left: 8, right: 8),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("Search.png"),
                          fit: BoxFit.contain, // Correct usage
                        ),
                      ),
                    ),
                    hintStyle: const TextStyle(
                      color: Color(0xFF6B6666),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(width: 2, color: Color(0x28575454)),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildCategoryButton('Appetizer', 'sate.png'),
                    buildCategoryButton('Main Course', 'sate.png'),
                    buildCategoryButton('Dessert', 'sate.png'),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Recommended Recipe',
                  style: GoogleFonts.ubuntu(
                    color: const Color(0xFF524D4D),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    shadows: [
                      Shadow(
                        offset: Offset(0, 5),
                        blurRadius: 5,
                        color: Color(0xFF000000).withOpacity(0.25),
                      ),
                    ],
                  ),
                ),
                const Divider(color: Color(0xFF02470E)),
                const SizedBox(height: 8),
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    buildRecipeCard('Salad Sayur', 'sate.png'),
                    buildRecipeCard('Soto Lamongan', 'sate.png'),
                    buildRecipeCard('Ayam Bakar', 'sate.png'),
                    buildRecipeCard('Pancake', 'sate.png'),
                    buildRecipeCard('Sate Ayam', 'sate.png'),
                    buildRecipeCard('Ikan Bakar', 'sate.png'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCategoryButton(String title, String imageUrl) {
    return Container(
      width: 125,
      height: 42,
      decoration: ShapeDecoration(
        color: const Color(0xFF8FC499),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      ),
      child: Row(
        children: [
          Container(
            width: 43,
            height: 43,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain, // Correct usage
              ),
            ),
          ),
          Expanded(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRecipeCard(String title, String imageUrl) {
    return Container(
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        shadows: const [
          BoxShadow(
            color: Color(0x3F000000),
            blurRadius: 4,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 142,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(imageUrl),
                fit: BoxFit.contain, // Correct usage
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Container(
                  width: 37,
                  height: 27,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('https://placehold.co/37x27'),
                      fit: BoxFit.contain, // Correct usage
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
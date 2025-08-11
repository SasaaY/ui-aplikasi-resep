import 'package:flutter/material.dart';
import 'package:ui_rplikasi_resep_masakan/constants/colors.dart';

class DetailScreen extends StatelessWidget {
  final String nama;
  final String gambar;
  final List<String> bahan;
  final List<String> langkah;

  const DetailScreen({
    super.key,
    required this.nama,
    required this.gambar,
    required this.bahan,
    required this.langkah,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
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
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      AppColors.lightGreen,
                      AppColors.lightGreen.withOpacity(0.7),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                child: AppBar(
                  elevation: 0,
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back, color: AppColors.darkGreen),
                    onPressed: () => Navigator.pop(context),
                  ),
                  title: Text(
                    'Kembali',
                    style: TextStyle(color: AppColors.darkGreen),
                  ),
                  backgroundColor: Colors.transparent,
                  bottom: TabBar(
                    tabs: [
                      Tab(text: "Bahan-bahan"),
                      Tab(text: "Langkah-langkah"),
                    ],
                    indicatorColor: AppColors.darkGreen,
                    labelColor: AppColors.darkGreen,
                    unselectedLabelColor: AppColors.mediumGray,
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: nama,
                            child: Image.asset(
                              'assets/$gambar',
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nama,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Bahan-bahan",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ...bahan.map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: nama,
                            child: Image.asset(
                              'assets/$gambar',
                              fit: BoxFit.cover,
                              height: 200,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  nama,
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Langkah-langkah",
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: AppColors.darkGreen,
                                  ),
                                ),
                                SizedBox(height: 10),
                                ...langkah.map(
                                  (item) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 2.0,
                                    ),
                                    child: Text(
                                      item,
                                      style: TextStyle(
                                        color: AppColors.mediumGray,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
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

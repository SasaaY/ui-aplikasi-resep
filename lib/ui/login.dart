import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_rplikasi_resep_masakan/ui/home.dart';
import '../ui/assets.dart' as app_asset;

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFF6F6F6), Color(0xFFACDDB5)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'L’Atelier du Chef\n',
                            style: GoogleFonts.ubuntu(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF02480F),
                            ),
                          ),
                          TextSpan(
                            text: 'BENGKEL SI KOKI',
                            style: GoogleFonts.ubuntu(
                              fontSize: 24,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF02480F),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'Sudah siap memperkaya koleksi masakan di rumah?\nAyo, lihat semua resep yang kami sajikan dan temukan ide-ide baru untuk setiap waktu makanmu!',
                      style: GoogleFonts.ubuntu(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF02480F),
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Image.asset(
                      app_asset.logo,
                      width: 295,
                      height: 283,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 10),
                    _AuthButton(
                      text: 'Create Account',
                      color: const Color(0xFF02480F),
                      textColor: Colors.white,
                      onTap: () => _showAuthModal(context, isLogin: false),
                    ),
                    _AuthButton(
                      text: 'Login',
                      color: Colors.white,
                      textColor: const Color(0xFF02480F),
                      borderColor: const Color(0xFF02480F),
                      onTap: () => _showAuthModal(context, isLogin: true),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _showAuthModal(BuildContext context, {required bool isLogin}) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      backgroundColor: const Color(0xFFB6EDC0),
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  isLogin ? 'Login' : 'Create Account',
                  style: GoogleFonts.ubuntu(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFF02480F),
                  ),
                ),
                const SizedBox(height: 20),
                _AuthTextField(
                  controller: emailController,
                  label: 'Email',
                  hint: 'info@example.com',
                ),
                const SizedBox(height: 20),
                _AuthTextField(
                  controller: passwordController,
                  label: 'Password',
                  hint: 'Password',
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                _AuthButton(
                  text: isLogin ? 'Login' : 'Register',
                  color: Colors.white,
                  textColor: const Color(0xFF02480F),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    ); // hanya tutup modal
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscureText;

  const _AuthTextField({
    required this.controller,
    required this.label,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
        ),
      ),
    );
  }
}

class _AuthButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final Color? borderColor;
  final VoidCallback? onTap;

  const _AuthButton({
    required this.text,
    required this.color,
    required this.textColor,
    this.borderColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 296,
        height: 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: color,
          border: borderColor != null
              ? Border.all(color: borderColor!, width: 3)
              : null,
          borderRadius: BorderRadius.circular(30),
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 5,
              color: Color(0x33000000),
            ),
          ],
        ),
        child: Text(
          text,
          style: GoogleFonts.ubuntu(
            fontSize: 22,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}

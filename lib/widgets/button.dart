import 'package:flutter/material.dart';

const Color kPrimaryBlue = Color(0xFF3F6FFF);
const Color kDarkText = Color(0xFF1E1E1E);

class Button extends StatelessWidget {
  final String title;
<<<<<<< HEAD
  final VoidCallback? onPressed; // 🔥 <-- ADICIONADO

  const Button({
    super.key,
    required this.title,
    this.onPressed, // 🔥 <-- ADICIONADO
  });
=======

  const Button({super.key, required this.title});
>>>>>>> b86550beafe84c9347949a9ebcc82192fa68d5e0

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
<<<<<<< HEAD
        onPressed: onPressed, // 🔥 <-- USANDO A FUNÇÃO RECEBIDA
=======
        onPressed: () {
          debugPrint('Aprender agora pressionado');
        },
>>>>>>> b86550beafe84c9347949a9ebcc82192fa68d5e0
        style: ElevatedButton.styleFrom(
          backgroundColor: kPrimaryBlue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          elevation: 0,
        ),
        child: Text(
          title,
<<<<<<< HEAD
          style: const TextStyle(
=======
          style: TextStyle(
>>>>>>> b86550beafe84c9347949a9ebcc82192fa68d5e0
            fontFamily: 'Inter',
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

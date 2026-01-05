import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/menu.dart';

// 1) Primeira tela: WelcomeScreenWithImages
import 'package:signcentral/screens/welcomescreen2.dart'; // class WelcomeScreenWithImages

// Demais telas
import 'package:signcentral/screens/sign_central_screen.dart';
import 'package:signcentral/screens/cadastro_screen.dart';
import 'package:signcentral/screens/test_screen.dart';
import 'package:signcentral/screens/welcome_screen_with_images.dart'; // class WelcomeScreen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/welcome_images',

      routes: {
        // 1) WelcomeScreenWithImages
        '/welcome_images': (context) => const WelcomeScreenWithImages(),

        // 2) SignCentral
        '/signcentral': (context) => const SignCentralScreen(),

        // 3) Login
        '/cad': (context) => const CadastroScreen(),

        // 4) Teste
        '/test': (context) => const TestScreen(),

        // 5) Última tela: WelcomeScreen
        '/welcome': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}

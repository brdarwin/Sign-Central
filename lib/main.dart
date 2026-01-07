import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/menu.dart';
import 'package:signcentral/screens/welcomescreen2.dart';
import 'package:signcentral/screens/sign_central_screen.dart';
import 'package:signcentral/screens/cadastro_screen.dart';
import 'package:signcentral/screens/test_screen.dart';
import 'package:signcentral/screens/welcome_screen_with_images.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        '/welcome_images': (context) => const WelcomeScreenWithImages(),

        '/signcentral': (context) => const SignCentralScreen(),

        '/cad': (context) => const CadastroScreen(),

        '/test': (context) => const TestScreen(),

        '/welcome': (context) => const WelcomeScreen(),
        '/menu': (context) => const MenuScreen(),
      },
    );
  }
}

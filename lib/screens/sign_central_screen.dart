import 'package:flutter/material.dart';
import 'package:signcentral/widgets/illustration_widget.dart';
import 'package:signcentral/widgets/button.dart'; // garante o import do Button
import 'package:signcentral/screens/cadastro_screen.dart';

class SignCentralScreen extends StatefulWidget {
  const SignCentralScreen({super.key});

  @override
  State<SignCentralScreen> createState() => _SignCentralScreenState();
}

class _SignCentralScreenState extends State<SignCentralScreen> {
  final TextEditingController emailController = TextEditingController();
  bool isValidEmail = false;

  bool _validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }

  @override
  void initState() {
    super.initState();
    emailController.addListener(() {
      final text = emailController.text;
      setState(() {
        isValidEmail = _validateEmail(text);
      });
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  // ===== método que o Button vai chamar =====
  void _onContinuePressed() {
    if (!isValidEmail) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Digite um e-mail válido.'),
        ),
      );
      return;
    }

    // aqui você decide para onde ir depois do e‑mail válido
    Navigator.pushReplacementNamed(context, '/cad');
    // ou: Navigator.pushReplacementNamed(context, '/test');
  }
  // ==========================================

  @override
  Widget build(BuildContext context) {
    const Color primaryBlue = Color(0xFF3F6FFF);
    const Color kDarkText = Color(0xFF1E1E1E);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.dark_mode_outlined, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            IllustrationWidget(
              illustrationName: 'logo_sign_central',
              height: 170,
            ),

            const SizedBox(height: 5),
            const Text(
              'Dê o primeiro passo na\n sua jornada em Libras.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                height: 1.3,
                color: kDarkText,
              ),
            ),

            const SizedBox(height: 30),
            const Text(
              'Email',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),

            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'user@gmail.com',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: primaryBlue, width: 2.0),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),

            const SizedBox(height: 16),

            Button(
              title: 'Continuar',
              onPressed: _onContinuePressed, // agora esse método existe
            ),

            const SizedBox(height: 24),

            Row(
              children: const <Widget>[
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'ou',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),

            const SizedBox(height: 24),

            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                side: const BorderSide(color: Colors.black26, width: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Cadastrar com Google',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text.rich(
                TextSpan(
                  text: 'Ao continuar, você concorda com nossos ',
                  style: const TextStyle(color: Colors.grey, fontSize: 16),
                  children: <TextSpan>[
                    TextSpan(
                      text: '\nTermos e Política de Privacidade.',
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),

            const SizedBox(height: 50),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Já tem uma conta? ',
                  style: TextStyle(color: Colors.black87, fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text(
                    'Faça Login',
                    style: TextStyle(
                      color: primaryBlue,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                      decorationColor: primaryBlue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

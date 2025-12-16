import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';
import 'package:signcentral/widgets/illustration_widget.dart';

// Definição das cores baseadas na imagem
const Color kPrimaryBlue = Color(0xFF3F6FFF);
const Color kDarkText = Color(0xFF1E1E1E);

class WelcomeScreenWithImages extends StatelessWidget {
  const WelcomeScreenWithImages({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.nights_stay_outlined,
              color: kDarkText,
            ),
            onPressed: () {
              // TODO: alternar tema
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // --- Logo ---
              Column(
                children: const [
                  IllustrationWidget(
                    illustrationName: 'logo_sign_central',
                    height: 100,
                  ),
                  SizedBox(height: 16),
                ],
              ),

              // --- Ilustração Principal ---
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  width: size.width * 0.85,
                  child: const IllustrationWidget(
                    illustrationName: 'illustration_main',
                    height: 600,
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // --- Texto de Chamada ---
              const Text(
                'Aprenda Libras,\nna palma da sua mão.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  height: 1.3,
                  color: kDarkText,
                ),
              ),

              const SizedBox(height: 20),

              // --- Botão principal ---
              Button(
                title: 'Aprender agora',
                onPressed: () {
                  Navigator.pushNamed(context, '/signcentral');
                },
              ),

              const SizedBox(height: 10),

              // --- Opção de Login ---
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Já tem uma conta? ',
                    style: TextStyle(
                      fontSize: 16,
                      color: kDarkText,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      debugPrint('Fazer Login pressionado');
                      // TODO: navegar para tela de login
                    },
                    child: const Text(
                      'Faça Login',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kPrimaryBlue,
                        decoration: TextDecoration.underline,
                        decorationColor: kPrimaryBlue,
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

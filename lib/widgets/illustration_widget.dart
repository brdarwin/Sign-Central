<<<<<<< HEAD
import 'package:flutter/material.dart';

class IllustrationWidget extends StatelessWidget {
  final String illustrationName;
  final double? height;
  final double? width;

  const IllustrationWidget({
    super.key,
    required this.illustrationName,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/png/$illustrationName.png',
      height: height,
      width: width,
      fit: BoxFit.contain,
=======
// lib/widgets/illustration_widget.dart (Sugestão de caminho)

import 'package:flutter/material.dart';

class IllustrationWidget extends StatelessWidget {
  final String illustrationName; // 'illustration_2', 'illustration_3', etc.
  final double height;
  final double? width;

  const IllustrationWidget({
    Key? key,
    required this.illustrationName,
    this.height = 250.0, // Altura padrão
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Certifique-se de que sua imagem 'illustration_2.png'
    // está no diretório 'assets/images' e configurada no pubspec.yaml
    return Image.asset(
      'assets/images/$illustrationName.png',
      height: height,
      width: width,
      fit: BoxFit.contain, // Ajusta a imagem mantendo a proporção
>>>>>>> b86550beafe84c9347949a9ebcc82192fa68d5e0
    );
  }
}

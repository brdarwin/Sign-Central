import 'package:flutter/material.dart';
import 'package:signcentral/screens/course_screens/class_trail_1.dart';
import 'package:signcentral/widgets/trail.dart';
import 'package:signcentral/widgets/button.dart';

class LoadTrailScreen extends StatefulWidget {
  final Trail trail;

  const LoadTrailScreen({super.key, required this.trail});

  @override
  State<LoadTrailScreen> createState() => _LoadTrailScreenState();
}

class _LoadTrailScreenState extends State<LoadTrailScreen> {
  bool _isLoading = false;

  Future<void> _onStartPressed() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);
    await Future.delayed(const Duration(seconds: 2));
    setState(() => _isLoading = false);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const Trail01LessonsScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final trail = widget.trail;

    return Scaffold(
      backgroundColor: trail.color,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(
          color: Colors.white,
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Trilha 01: Conheça o alfabeto, e \ncumprimentos básicos em Libras.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),

                const SizedBox(height: 24),

                SizedBox(
                  height: 500,
                  child: Image.asset(trail.imagePath, fit: BoxFit.contain),
                ),

                const SizedBox(height: 24),

                Button(
                  title: _isLoading ? 'Carregando...' : 'Vamos começar!',
                  onPressed: _isLoading ? null : _onStartPressed,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

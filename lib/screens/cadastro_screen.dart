import 'package:flutter/material.dart';
import 'package:signcentral/widgets/button.dart';
import 'package:signcentral/widgets/illustration_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';

String getFirstTwoNames(String fullName) {
  final parts = fullName.trim().split(RegExp(r'\s+'));
  if (parts.isEmpty) return '';
  if (parts.length == 1) return parts.first;
  return '${parts[0]} ${parts[1]}';
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _fullNameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  //Obs: encontrar um meio de coletar o restante dos dados após  a implementação do db
  //Obs2: o método tem um try catch para tratamento de erros. Dessa alguns validators não são mais necessários.
  Future<void> _signUpUser(
    BuildContext context,
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Conta Criad Com Sucesso.')));
    } on FirebaseAuthException catch (e) {
      String message = 'Um erro ocerreu.';
      if (e.code == 'weak-password') {
        message = 'Senha muit fraca, tente uma mais forte';
      } else if (e.code == 'email-already-in-use') {
        message = 'email já registrado';
      }
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      print(e);
    }
  }

  void _onContinuePressed() {
    if (_formKey.currentState!.validate()) {
      final String fullName = _fullNameController.text;
      final String username = _usernameController.text;
      final String password = _passwordController.text;

      final String shortName = getFirstTwoNames(fullName);

      debugPrint('Nome Completo: $fullName');
      debugPrint('Nome Abreviado: $shortName');
      debugPrint('Nome de Usuário: $username');
      debugPrint('Senha: $password');

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Dados validados!'),
          backgroundColor: Color(0xFF00FF08),
        ),
      );

      Navigator.pushReplacementNamed(context, '/test', arguments: shortName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final String email = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const IllustrationWidget(
                illustrationName: 'illustration_2',
                height: 500,
              ),
              const SizedBox(height: 10.0),

              Text(
                'Nome Completo',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _fullNameController,
                decoration: const InputDecoration(
                  hintText: 'Insira seu nome completo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome completo';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8.0),

              Text(
                'Nome de Usuário',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                  hintText: 'username001',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um nome de usuário';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 8),

              // --- Campo Senha ---
              Text('Senha', style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _passwordController,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  hintText: 'Insira sua senha',
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.0)),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 12.0,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.length < 8) {
                    return 'A senha deve conter no mínimo 8 caracteres';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32.0),

              Button(
                title: 'Continuar',
                onPressed: () => {
                  _signUpUser(context, email, _passwordController.text),
                  _onContinuePressed(),
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

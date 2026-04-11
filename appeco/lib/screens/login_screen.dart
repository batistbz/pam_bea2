import 'package:appeco/screens/home_screen.dart';
import 'package:appeco/screens/register_screen.dart';
import 'package:appeco/services/auth_services.dart';
import 'package:flutter/material.dart';

//com comandos para facilitar
//stl - para criação de classes Statefull /Stat

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //criar as variaveis
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool ocultarSenha = true;
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                //alignment: Alignment.bottomLeft,
                children: [
                  Image.asset(
                    "assets/ecotrack.png",
                    width: 210,
                    height: 210,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 50), // espaço entre a logo e os campos de texto
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'E-mail',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite seu e-mail";
                  }
                  if (!value.contains("@") || !value.contains(".")) {
                    return "E-mail Inválido";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Digite sua senha";
                  }
                  if (value.length < 6) {
                    return "Senha deve ter no mínimo 6 caracteres";
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    //print("Relizar Login");
                    validarLogin();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    "Entrar",
                    style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //função validar login
  void validarLogin() {
    if (_formKey.currentState!.validate()) {
      String email = emailController.text;
      String senha = senhaController.text;

      String? resultado = authService.login(email, senha);

      if (resultado != null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(resultado)));
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login Realizado com Sucesso")));
      }
    }
  }
}
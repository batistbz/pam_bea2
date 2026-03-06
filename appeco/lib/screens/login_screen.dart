import 'package:flutter/material.dart';

//com comandos para facilitar
//stl - para criação de classes Statefull /Stat

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //criar as variantes
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();
  FocusNode emailFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();
  double opacity = 0.5;

@override
void initState() {
  super.initState();
  emailFocus.addListener(() {
    setState(() {});
  });
  senhaFocus.addListener(() {
    setState(() {});
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 248, 231), // cor de fundo
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                height: 210,
                width: 210,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: AlignmentGeometry.bottomCenter,
                      end: AlignmentGeometry.topCenter,
                      colors: [
                        Color.fromARGB(255, 229, 248, 231),
                        Color.fromARGB(255, 218, 245, 221),
                        Color.fromARGB(255, 196, 240, 217),
                        Color.fromARGB(255, 229, 248, 231)
                      ],
                    ),
                  ),
            ),
            Align(
              alignment: Alignment.center,
              child: Image.asset(
                'assets/ecotrack.png',
                height: 210,
              ),
            )
              ],
            ),
              const SizedBox(height: 20), // espacinho entre a logo e os campos de texto
            TextField(
              focusNode: emailFocus,
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',

                prefixIcon: Icon(
                  Icons.email,
                  color: emailFocus.hasFocus ? Colors.green : const Color.fromARGB(255, 84, 83, 83), // muda a cor do icone
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),

                floatingLabelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 16), // espacinho entre os campos de texto
            TextField(
              focusNode: senhaFocus,
              controller: senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',

                prefixIcon: Icon(
                  Icons.lock,
                  color: senhaFocus.hasFocus ? Colors.green : const Color.fromARGB(255, 84, 83, 83), // muda a cor do icone
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),

                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Colors.green,
                    width: 2,
                  ),
                ),
                floatingLabelStyle: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text("Entrar"),
            ),
          ],
        ),
      ),
    );
  }
}
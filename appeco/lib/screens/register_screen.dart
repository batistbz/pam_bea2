import 'package:appeco/screens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> { // variaveis para o preenchimento dos campos

  FocusNode nomeFocus = FocusNode();
  FocusNode rmFocus = FocusNode();
  FocusNode turmaFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode senhaFocus = FocusNode();

  @override
  void initState() {
    super.initState();

    nomeFocus.addListener(() => setState(() {}));
    rmFocus.addListener(() => setState(() {}));
    turmaFocus.addListener(() => setState(() {}));
    emailFocus.addListener(() => setState(() {}));
    senhaFocus.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nomeFocus.dispose();
    rmFocus.dispose();
    turmaFocus.dispose();
    emailFocus.dispose();
    senhaFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(255, 229, 248, 231), // cor de fundo
      appBar: AppBar( // navbar com logo do lado esquerdo
        backgroundColor: Colors.green[50],
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20), // espaço da logo entre as margens
          child: GestureDetector(
            onTap: () {
              // Navega para a 'DetalhesPage'
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            child: Image.asset(
              'assets/ecotrack.png',
              width: 110, // tamanho da logo
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                focusNode: nomeFocus,
                decoration: InputDecoration(
                  labelText: "Nome",

                  prefixIcon: Icon(  // alteração de cor do icone quando clicado
                    Icons.person,
                    color: nomeFocus.hasFocus ? Colors.green : Colors.grey,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 15), // espaço entre um campo e outro

              TextField(
                focusNode: rmFocus,
                decoration: InputDecoration(
                  labelText: "RM",

                  prefixIcon: Icon(  // alteração de cor do icone quando clicado
                    Icons.badge,
                    color: rmFocus.hasFocus ? Colors.green : Colors.grey,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 15), // espaço entre um campo e outro

              TextField(
                focusNode: turmaFocus,
                decoration: InputDecoration(
                  labelText: "Turma",

                  prefixIcon: Icon( // alteração de cor do icone quando clicado
                    Icons.groups,
                    color: turmaFocus.hasFocus ? Colors.green : Colors.grey,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 15), // espaço entre um campo e outro

              TextField(
                focusNode: emailFocus,
                decoration: InputDecoration(
                  labelText: "Email",

                  prefixIcon: Icon( // alteração de cor do icone quando clicado
                    Icons.email,
                    color: emailFocus.hasFocus ? Colors.green : Colors.grey,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 15), // espaço entre um campo e outro

              TextField(
                focusNode: senhaFocus,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Senha",

                  prefixIcon: Icon( // alteração de cor do icone quando clicado
                    Icons.lock,
                    color: senhaFocus.hasFocus ? Colors.green : Colors.grey,
                  ),

                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),

                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(
                      color: Colors.green,
                      width: 2,
                    ),
                  ),

                  floatingLabelStyle: const TextStyle(
                    color: Colors.green,
                  ),
                ),
              ),

              const SizedBox(height: 30), // espaço entre o campo de senha e o botão

              ElevatedButton( // estilização do botão
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60,
                    vertical: 14,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                onPressed: () {},

                child: const Text( // estilização do textinho dentro do botão
                  "Cadastrar",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "Já tenho conta",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green, // cor do texto dentro do botão
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
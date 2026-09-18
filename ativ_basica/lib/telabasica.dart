import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final String userName = 'Beatriz';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 248, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 250, 250, 250),
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Color.fromARGB(255, 50, 48, 154)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 50, 48, 154)),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Color.fromARGB(255, 50, 48, 154)),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Olá, $userName',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 50, 48, 154),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Seja Bem Vindo!',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 4),
            const Text(
              'Gostou? Já dizia o grupo de pagode, Menos é Mais!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 50, 48, 154),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

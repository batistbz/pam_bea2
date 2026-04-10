import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
 State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 248, 231),

      // 🔝 APPBAR (igual ao seu)
      appBar: AppBar(
        backgroundColor: Colors.green[50],
        automaticallyImplyLeading: false,
        toolbarHeight: 80,
        titleSpacing: 0,
        title: Padding(
          padding: const EdgeInsets.only(top: 10, left: 20),
          child: Image.asset(
            'assets/ecotrack.png',
            width: 110,
          ),
        ),
      ),

      // 👇 BODY (parte nova organizada)
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // 👋 Cabeçalho
              const Text(
                "Olá, Erika 👋",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 4),
              const Text("Bem-vinda ao EcoTrack"),

              const SizedBox(height: 20),

              // 📊 RESUMO
              const Text(
                "📊 RESUMO",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  resumoCard("♻️", "12", "Coletas"),
                  resumoCard("🏆", "340", "Pontos"),
                ],
              ),

              const SizedBox(height: 10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  resumoCard("🌱", "18kg", "CO₂"),
                  resumoCard("🎯", "75%", "Meta"),
                ],
              ),

              const SizedBox(height: 20),

              // ⚡ AÇÕES RÁPIDAS
              const Text(
                "⚡ AÇÕES RÁPIDAS",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              acaoItem(Icons.add, "Registrar coleta"),
              acaoItem(Icons.location_on, "Pontos de coleta"),
              acaoItem(Icons.bar_chart, "Relatórios"),
              acaoItem(Icons.history, "Histórico"),

              const SizedBox(height: 20),

              // 🕒 ATIVIDADES RECENTES
              const Text(
                "🕒 ATIVIDADES RECENTES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),

              atividadeItem("♻️ Plástico reciclado", "+20 pts"),
              atividadeItem("📄 Papel descartado", "+10 pts"),
              atividadeItem("🍾 Vidro reciclado", "+15 pts"),
            ],
          ),
        ),
      ),

      // 👇 sua navbar entra aqui depois
      // bottomNavigationBar: SuaNavBar(),
    );
  }

  // 🔲 Card de resumo
  Widget resumoCard(String icon, String valor, String label) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Text(icon, style: const TextStyle(fontSize: 20)),
          const SizedBox(height: 5),
          Text(
            valor,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(label),
        ],
      ),
    );
  }

  // ⚡ Ações rápidas
  Widget acaoItem(IconData icon, String texto) {
    return ListTile(
      leading: Icon(icon),
      title: Text(texto),
      onTap: () {},
    );
  }

  // 🕒 Atividades recentes
  Widget atividadeItem(String titulo, String pontos) {
    return ListTile(
      leading: Text(titulo.split(" ")[0]),
      title: Text(titulo.substring(2)),
      trailing: Text(pontos),
    );
  }
}
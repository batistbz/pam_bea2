import 'package:flutter/material.dart';
import 'package:appeco/widgets/resumo_card.dart';
import 'package:appeco/widgets/acao_rapida_card.dart';
import 'package:appeco/widgets/atividade_item_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final String userName = 'Erika';

  @override
  Widget build(BuildContext context) {
    final String dataAtual =
        DateTime.now().toString().split(' ')[0];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 229, 248, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 229, 248, 231),
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Row(
          children: [
            Image(
              image: AssetImage('assets/ecotrack.png'),
              height: 100,
              width: 100,
            ),
            SizedBox(width: 18),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.person, color: Color.fromARGB(255, 43, 112, 28)),
            onPressed: () {
              // Ir para perfil
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications, color: Color.fromARGB(255, 43, 112, 28)),
            onPressed: () {
              // Ir para notificações
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Color.fromARGB(255, 43, 112, 28)),
            onPressed: () {
              // Fazer logout
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Saudação
            Text(
              'Olá, $userName 👋',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 21, 175, 62),
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Bem-vinda ao EcoTrack',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Hoje: $dataAtual',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black45,
              ),
            ),

            const SizedBox(height: 24),

            // Resumo
            const Text(
              '📊 RESUMO',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 114, 40),
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.3,
              children: [
                ResumoCard(
                  icon: Icons.recycling,
                  title: 'Coletas',
                  value: '12',
                ),
                ResumoCard(
                  icon: Icons.emoji_events,
                  title: 'Pontos',
                  value: '340',
                ),
                ResumoCard(
                  icon: Icons.eco,
                  title: 'CO₂',
                  value: '18kg',
                ),
                ResumoCard(
                  icon: Icons.track_changes,
                  title: 'Meta',
                  value: '75%',
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Ações rápidas
            const Text(
              '⚡ AÇÕES RÁPIDAS',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 114, 40),
              ),
            ),
            const SizedBox(height: 12),

            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 1.7,
              children: [
                AcaoRapidaCard(
                  icon: Icons.add_circle_outline,
                  title: 'Registrar coleta',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.location_on_outlined,
                  title: 'Pontos de coleta',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.bar_chart,
                  title: 'Relatórios',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.history,
                  title: 'Histórico',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.flag_outlined,
                  title: 'Metas ambientais',
                  onTap: () {},
                ),
                AcaoRapidaCard(
                  icon: Icons.lightbulb_outline,
                  title: 'Dicas sustentáveis',
                  onTap: () {},
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Atividades recentes
            const Text(
              '🕒 ATIVIDADES RECENTES',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 14, 114, 40),
              ),
            ),
            const SizedBox(height: 12),

            const AtividadeItem(
              icon: Icons.recycling,
              title: 'Plástico reciclado',
              points: '+20 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.description_outlined,
              title: 'Papel descartado',
              points: '+10 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.local_drink_outlined,
              title: 'Vidro reciclado',
              points: '+15 pts',
            ),
            const SizedBox(height: 10),
            const AtividadeItem(
              icon: Icons.notifications_active_outlined,
              title: 'Meta semanal atualizada',
              points: 'Nova meta',
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color.fromARGB(255, 229, 248, 231),
        selectedItemColor: const Color.fromARGB(255, 38, 88, 39),
        unselectedItemColor:const Color(0xFF4CAF50),
        type: BottomNavigationBarType.fixed,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          // Exemplo de navegação futura:
          // if (index == 1) Navigator.push(...);
          // if (index == 2) Navigator.push(...);
          // if (index == 3) Navigator.push(...);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Histórico',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'Mapa',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}


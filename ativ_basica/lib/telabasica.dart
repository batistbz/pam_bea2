import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2F6F4E)),
        useMaterial3: true,
      ),
      home: const CadastroScreen(),
    );
  }
}

/// Componente reutilizável de campo de texto.
class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.label,
    required this.controller,
    this.hint,
    this.icon,
    this.obscure = false,
    this.keyboardType,
    this.inputFormatters,
    this.maxLength,
    this.validator,
    this.textInputAction,
    this.onFieldSubmitted,
  });

  final String label;
  final String? hint;
  final IconData? icon;
  final bool obscure;
  final TextEditingController controller;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextFormField(
        controller: controller,
        obscureText: obscure,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        validator: validator,
        textInputAction: textInputAction,
        onFieldSubmitted: onFieldSubmitted,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          counterText: '',
          prefixIcon: icon == null ? null : Icon(icon),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}

class CadastroScreen extends StatefulWidget {
  const CadastroScreen({super.key});

  @override
  State<CadastroScreen> createState() => _CadastroScreenState();
}

class _CadastroScreenState extends State<CadastroScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _email = TextEditingController();
  final _telefone = TextEditingController();
  final _senha = TextEditingController();

  bool _aceitouTermos = false;
  bool _enviando = false;

  @override
  void dispose() {
    _nome.dispose();
    _email.dispose();
    _telefone.dispose();
    _senha.dispose();
    super.dispose();
  }

  Future<void> _salvar() async {
    final valido = _formKey.currentState?.validate() ?? false;

    if (!valido) return;

    if (!_aceitouTermos) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Marque o aceite dos termos para continuar.')),
      );
      return;
    }

    setState(() => _enviando = true);
    await Future.delayed(const Duration(seconds: 1)); // chamada de API aqui
    if (!mounted) return;
    setState(() => _enviando = false);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Conta criada para ${_nome.text.trim()}.')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criar conta')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Preencha seus dados',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: 24),
                    AppTextField(
                      label: 'Nome completo',
                      hint: 'Maria Silva',
                      icon: Icons.person_outline,
                      controller: _nome,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        final valor = v?.trim() ?? '';
                        if (valor.isEmpty) return 'Informe seu nome.';
                        if (!valor.contains(' ')) return 'Informe nome e sobrenome.';
                        return null;
                      },
                    ),
                    AppTextField(
                      label: 'E-mail',
                      hint: 'maria@exemplo.com',
                      icon: Icons.mail_outline,
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        final valor = v?.trim() ?? '';
                        final regex = RegExp(r'^[\w.\-+]+@[\w\-]+\.[\w\-.]+$');
                        if (valor.isEmpty) return 'Informe seu e-mail.';
                        if (!regex.hasMatch(valor)) return 'E-mail inválido.';
                        return null;
                      },
                    ),
                    AppTextField(
                      label: 'Telefone',
                      hint: '11999999999',
                      icon: Icons.phone_outlined,
                      controller: _telefone,
                      keyboardType: TextInputType.phone,
                      maxLength: 11,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      textInputAction: TextInputAction.next,
                      validator: (v) {
                        final valor = v?.trim() ?? '';
                        if (valor.isEmpty) return 'Informe seu telefone.';
                        if (valor.length < 10) return 'Inclua o DDD e o número completo.';
                        return null;
                      },
                    ),
                    AppTextField(
                      label: 'Senha',
                      icon: Icons.lock_outline,
                      controller: _senha,
                      obscure: true,
                      textInputAction: TextInputAction.done,
                      onFieldSubmitted: (_) => _salvar(),
                      validator: (v) {
                        final valor = v ?? '';
                        if (valor.length < 8) return 'Use pelo menos 8 caracteres.';
                        if (!valor.contains(RegExp(r'[0-9]'))) {
                          return 'Inclua ao menos um número.';
                        }
                        return null;
                      },
                    ),
                    CheckboxListTile(
                      value: _aceitouTermos,
                      onChanged: (v) => setState(() => _aceitouTermos = v ?? false),
                      controlAffinity: ListTileControlAffinity.leading,
                      contentPadding: EdgeInsets.zero,
                      title: const Text('Aceito os termos de uso'),
                    ),
                    const SizedBox(height: 16),
                    FilledButton(
                      onPressed: _enviando ? null : _salvar,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                      ),
                      child: _enviando
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : const Text('Criar conta'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
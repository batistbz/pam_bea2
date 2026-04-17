import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = Firebase.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> registrarUsuario ({
    required String nome,
    required String sobrenome,
    required String email,
    required String telefone,
    required String senha,
    required String confirmarsenha

  })async{
    // tratamento de exceções
    try{
      UserCredntial credencial = await _auth.createUserWithEmailAndPassword(
        email: email, 
        password: password
        );

      String uid = credencial.user!.uid;
      await _firestore.collection('usuarios').doc(uid).set({
        'nome': nome,
        'sobrenome': sobrenome,
        'email': email,
        'telefone': telefone,
        'senha': senha,
        'confirmarsenha': confirmarsenha
      });
      return null; 

    } on FirebaseAuthException catch(e){
      
    }
  }
}
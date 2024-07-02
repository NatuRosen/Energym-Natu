import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController passController = TextEditingController();
    TextEditingController userController = TextEditingController();
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: userController,
              decoration: InputDecoration(
                hintText: 'Username',
                icon: Icon(Icons.person_2_outlined),
              ),
            ),
            TextField(
              controller: passController,
              decoration: InputDecoration(
                hintText: 'Password',
                icon: Icon(Icons.lock_clock_outlined),
              ),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: () {
                String userInput = userController.text;
                String passInput = passController.text;

                if (userInput.isEmpty || passInput.isEmpty) {
                  const vacio = SnackBar(
                  content: Text('Usuario o contraseña vacíos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(vacio);
                  print('Vacío');
                  return;
                }
                if ((userInput == 'Natu') && (passInput == '12345')) {
                  print('Login exitoso');
                  context.push('/homeScreen', extra: userInput);
                } else {
                  const incorrecto = SnackBar(
                  content: Text('Usuario o contraseña vacíos'),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(incorrecto);
                  print('Login Fallido');
                }
              },
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
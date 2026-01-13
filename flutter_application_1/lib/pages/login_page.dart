import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/user.dart';
import 'package:flutter_application_1/pages/widget/widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LOGIN', style: TextStyle(fontSize: 30)),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Email',
                      ),
                      onEditingComplete: () {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: 'Password',
                      ),
                      onEditingComplete: () {
                        setState(() {});
                      },
                    ),
                    SizedBox(height: 20),
                    FilledButton(
                      onPressed: () {
                        onLoginPressed();
                      },
                      child: Text('Login'),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() {
    final email = controllerEmail.text.trim();
    final password = controllerPassword.text;

    try {
      final user = users.firstWhere(
        (u) => u.email == email && u.password == password,
      );
      currentUser = user;

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => WidgetTree()),
        (_) => false,
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Login Failed'),
          content: Text('Wrong email or password'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }
}

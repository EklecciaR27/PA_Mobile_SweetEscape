// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:sweet_escape_apps/home_page.dart';

import 'authentication.dart';
import 'signUp.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();

  final TextEditingController _ctrlPassword = TextEditingController();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    setState(() => _loading = true);

    try {
      await Auth().login(email, password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login successful!'),
        ),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomePage()),
      );
    } catch (e) {
      print("Error: $e");

      String errorMessage =
          "Failed to login. Please check your email and password.";

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(errorMessage),
        ),
      );
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //height: 900,
        decoration: BoxDecoration(
          color: Color(0xFF66A2AD),
        ),
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(0),
            child: Container(
              margin: EdgeInsets.only(top: 230),
              width: 500,
              height: 900,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  margin: EdgeInsets.only(top: 70),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50),
                      TextFormField(
                        controller: _ctrlEmail,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silakan Masukkan Email Anda';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: 'Email',
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _ctrlPassword,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Silakan Masukkan Password Anda';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40.0)),
                          hintText: 'Password',
                        ),
                      ),
                      SizedBox(height: 40),
                      ElevatedButton(
                        onPressed: () => handleSubmit(),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              const Color(0xFF8AB7BA)),
                          foregroundColor: MaterialStateProperty.all(
                              const Color(0xFF35656F)),
                          fixedSize:
                              MaterialStateProperty.all(const Size(200, 30.0)),
                        ),
                        child: _loading
                            ? const SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 2,
                                ),
                              )
                            : Text("Submit"),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Regis()));
                        },
                        child: Text(
                            "Belum Punya Akun? Klik Disini Untuk Register"),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields

import 'package:flutter/material.dart';
import 'authentication.dart';
import 'signIn.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlUsername = TextEditingController();

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    final username = _ctrlUsername.value.text;

    try {
      setState(() => _loading = true);
      await Auth().regis(email, password, username);
    } catch (e) {
      print('Kesalahan selama registrasi: $e');
    } finally {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF66A2AD),
          ),
          child: Column(
            children: [
              const SizedBox(
                  height: 20), // Untuk memberikan jarak antara teks dan gambar
              Image.asset(
                'images/intro2.png',
                width: 300,
                height: 300,
              ),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Container(
                    margin: EdgeInsets.only(),
                    width: lebar,
                    height: 500,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 255, 255, 255),
                      borderRadius:
                          BorderRadius.only(topLeft: Radius.circular(60)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Container(
                        margin: EdgeInsets.only(top: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Register Your Account",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 50),
                            TextFormField(
                              controller: _ctrlUsername,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Silakan Masukkan Username Anda';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(40.0)),
                                hintText: 'Username',
                              ),
                            ),
                            SizedBox(height: 10),
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
                            SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: () => handleSubmit(),
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(
                                    const Color(0xFF8AB7BA)),
                                foregroundColor: MaterialStateProperty.all(
                                    const Color(0xFF35656F)),
                                fixedSize: MaterialStateProperty.all(
                                    const Size(200, 30.0)),
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
                                  : Text("Sign Up"),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Login()));
                              },
                              child: Text(
                                  "Sudah Punya Akun? Klik Disini Untuk Login"),
                            )
                          ],
                        ),
                      ),
                    ),
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

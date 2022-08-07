import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'forgot_pw_page.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[700],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 35),
                // BARBOTZ
                Container(
                  height: 59,
                  child: Text(
                    'BARBOTZ',
                    style: GoogleFonts.bigShouldersStencilText(
                        color: Colors.brown[900],
                        fontSize: 60,
                        fontWeight: FontWeight.w900),
                  ),
                ),

                Text(
                  'PERFECT MIXED COCKTAILS',
                  style: GoogleFonts.montserrat(
                      color: Colors.brown[200],
                      fontSize: 14,
                      fontWeight: FontWeight.w300),
                ),

                const SizedBox(height: 120),

                Text(
                  'Hello Again!',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.deepOrange[200],
                    fontSize: 36,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Welcome back, you´ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 19.0,
                  ),
                ),

                const SizedBox(height: 40),

                // email textfield
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _emailController,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange.shade200),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.brown[800],
                        filled: true,
                      ),
                    )),
                const SizedBox(height: 10),
                // password textfield
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade100),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.deepOrange.shade200),
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        hintText: 'Password',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.brown[800],
                        filled: true,
                      ),
                    )),
                const SizedBox(height: 10),

                // sign in Button
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                          child: Text(
                        'Sign In',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w900),
                      )),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgotPasswordPage();
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Colors.orange[400],
                        fontSize: 13,
                        fontWeight: FontWeight.w700),
                  ),
                ),

                const SizedBox(height: 15),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?  ',
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showRegisterPage,
                      child: Text(
                        'Register now',
                        style: TextStyle(
                            color: Colors.deepOrange[400],
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 250),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

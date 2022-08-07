import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback showLoginPage;

  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  Future signUp() async {
    // create user with email and password
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      // add user details
      addUserDeatails(
        _firstNameController.text.trim(),
        _emailController.text.trim(),
      );
    }
  }

  Future addUserDeatails(String firstname, String email) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstname,
      'email': email,
    });
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
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

                const SizedBox(height: 90),

                Text(
                  'Hello There!',
                  style: GoogleFonts.bebasNeue(
                    color: Colors.deepOrange[200],
                    fontSize: 36,
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  'Register below with your details!',
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 19.0,
                  ),
                ),

                const SizedBox(height: 40),

                // first name textfield
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _firstNameController,
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
                        hintText: 'First Name',
                        hintStyle: TextStyle(color: Colors.white),
                        fillColor: Colors.brown[800],
                        filled: true,
                      ),
                    )),
                const SizedBox(height: 10),

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

                // password textfield
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      controller: _confirmPasswordController,
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
                        hintText: 'Confirm Password',
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
                    onTap: signUp,
                    child: Container(
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Colors.deepOrange[200],
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                          child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 14,
                            fontWeight: FontWeight.w900),
                      )),
                    ),
                  ),
                ),

                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'I am a member!  ',
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                    GestureDetector(
                      onTap: widget.showLoginPage,
                      child: Text(
                        'Sign In',
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

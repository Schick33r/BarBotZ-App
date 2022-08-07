import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text('Password reset link sent! Check your email!'),
            );
          }).then((value) => Navigator.pop(context));
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[700],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.brown[700],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                'Enter Your Email',
                style: GoogleFonts.bebasNeue(
                  color: Colors.deepOrange[200],
                  fontSize: 36,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'and we send you a password reset link',
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

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  onTap: passwordReset,
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange[200],
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Center(
                        child: Text(
                      'Reset Password',
                      style: TextStyle(
                          color: Colors.black87,
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    )),
                  ),
                ),
              ),
              const SizedBox(height: 350)
            ],
          ),
        ));
  }
}

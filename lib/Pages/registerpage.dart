// ignore_for_file: prefer_const_constructors, unnecessary_string_escapes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:chatapp/Components/frosted_glass.dart';
import 'package:flutter/material.dart';
import 'package:chatapp/Services/auth_service.dart';
import 'package:chatapp/Components/button.dart';
import 'package:chatapp/Components/textfield.dart';
import 'package:google_fonts/google_fonts.dart';

class Registerpage extends StatelessWidget {
  final void Function() onTap;

  const Registerpage({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return RegisterpageMobile(onTap: onTap);
        } else {
          return RegisterpageDesktop(onTap: onTap);
        }
      },
    );
  }
}

class RegisterpageMobile extends StatefulWidget {
  final void Function() onTap;

  const RegisterpageMobile({super.key, required this.onTap});

  @override
  State<RegisterpageMobile> createState() => _RegisterpageMobileState();
}

class _RegisterpageMobileState extends State<RegisterpageMobile> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            _usernameController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
                const SizedBox(height: 50),
                Text(
                  'Welcome back you\'ve been missed!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 25),
                MyTextField(
                  controller: _usernameController,
                  obscureText: false,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _passwordController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                MyTextField(
                  controller: _confirmController,
                  obscureText: true,
                ),
                const SizedBox(height: 10),
                Button(
                  text: 'Register',
                  onTap: () => register(context),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        'lib/images/google.png',
                        height: 40,
                      ),
                    ),
                    SizedBox(width: 20),
                    Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey[200],
                      ),
                      child: Image.asset(
                        'lib/images/apple.png',
                        height: 40,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RegisterpageDesktop extends StatefulWidget {
  final void Function()? onTap;

  const RegisterpageDesktop({super.key, required this.onTap});

  @override
  State<RegisterpageDesktop> createState() => _RegisterpageDesktopState();
}

class _RegisterpageDesktopState extends State<RegisterpageDesktop> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  void register(BuildContext context) {
    final _auth = AuthService();
    if (_passwordController.text == _confirmController.text) {
      try {
        _auth.signUpWithEmailAndPassword(
            _usernameController.text, _passwordController.text);
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Passwords don't match"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'lib/images/backe.png'), // Ensure this path is correct
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
            alignment: Alignment.centerRight,
            child: SingleChildScrollView(
              child: FrostedGlassBox(
                mainAxisAlignment: MainAxisAlignment.start,
                theWidth: 500,
                theHeight: 700,
                children: [
                  SizedBox(height: 50),
                  Text('Welcome!',
                      style: GoogleFonts.chivo(
                        color: Colors.white,
                        fontSize: 64,
                      )),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Username',
                          style: GoogleFonts.chivo(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MyTextField(
                          controller: _usernameController,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Password',
                          style: GoogleFonts.chivo(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MyTextField(
                          controller: _passwordController,
                          obscureText: true,
                        ),
                      ),
                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50.0),
                        child: Text(
                          'Confirm Password',
                          style: GoogleFonts.chivo(
                            color: Colors.white,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child:  MyTextField(
                            controller: _confirmController,
                              obscureText: true,
                              ),
                      ),

                      SizedBox(height: 25),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: GestureDetector(
                          onTap: widget.onTap,
                          child: Text(
                            "Already a User?",
                            style: GoogleFonts.chivo(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 16

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Button(
                        text: 'Register',
                        onTap: () => register(context),
                        ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



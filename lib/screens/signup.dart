import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();
  var emailController = '';
  var passwordController = '';
  var _isLoading = false;

  void _submit() async {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      final user = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController,
        password: passwordController,
      );
      Navigator.of(context).pop();
      setState(() {
        _isLoading = false;
      });
    } on FirebaseAuthException catch (error) {
      var message = 'An error occurred, please check your credentials!';
      if (error.message != null) {
        message = error.message!;
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(message),
        ),
      );
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://images.ctfassets.net/4cd45et68cgf/7LrExJ6PAj6MSIPkDyCO86/542b1dfabbf3959908f69be546879952/Netflix-Brand-Logo.png',
          width: 130,
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              color: Colors.black,
              margin: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('Create Account',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              )),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Email',
                          fillColor: Colors.grey.withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onSaved: (newValue) => emailController = newValue!,
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          fillColor: const Color.fromARGB(255, 167, 165, 165)
                              .withOpacity(0.5),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          labelStyle: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 6) {
                            return 'Please enter valid password with minimum length of 6';
                          }
                          return null;
                        },
                        onSaved: (newValue) => passwordController = newValue!,
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            _submit();
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Colors.transparent,
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                                side: const BorderSide(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          child: !_isLoading
                              ? const Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              : const CircularProgressIndicator(
                                  backgroundColor: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text(
                          'Already have an account? Sign In',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

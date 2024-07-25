import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // void shzaib() {
  //   Text String;
  //   Color favcolor;
  // }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  void SignUp(String emailControl, String passControl) async {
    if (_key.currentState!.validate()) {
      //await _auth.signInWithEmailAndPassword(email: emailControl, password: passControl)
      await _auth.createUserWithEmailAndPassword(
          email: emailControl, password: passControl);
    }
  }

  void _formsubmit() {
    final isvalid = _key.currentState!.validate();
    if (isvalid) {
      return;
    }
    _key.currentState!.save();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/login.png'), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 35, top: 100),
              child: Text(
                'Welcome\nBack',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.4,
                  right: 35,
                  left: 35,
                ),
                child: Form(
                  key: _key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              hintText: 'E-mail',
                              hintStyle: TextStyle(color: Colors.black),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please ! Enter E-mail Address";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          obscuringCharacter: '*',
                          decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.black),
                              hintText: 'Password',
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please !  Entrer Password";
                            }
                            return null;
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.black87,
                            child: IconButton(
                              color: Colors.white,
                              onPressed: () => _formsubmit(),
                              icon: Icon(Icons.arrow_forward),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, 'register');
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 17,
                                    color: Colors.black),
                              )),
                          TextButton(
                              onPressed: () {
                                SignUp(emailController.text,
                                    passwordController.text);
                                Navigator.pushNamed(context, 'listview');
                              },
                              child: Text(
                                'Forget Password',
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 17,
                                    color: Colors.black),
                              )),
                        ],
                      )
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:msync/accounts/login.dart';
import 'package:msync/constants.dart';

class AccountRegister extends StatefulWidget {
  AccountRegister({Key? key}) : super(key: key);

  @override
  _AccountRegisterState createState() => _AccountRegisterState();
}

class _AccountRegisterState extends State<AccountRegister> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  signUpUser() async {
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _emailController.text, password: _passwordController.text)
          .then((value) {
        String uid = value.user!.uid;
        userCollection.doc(uid).set({
          "username": _usernameController.text,
          "email": _emailController.text,
          "password": _passwordController.text,
          "uid": uid,
        });
      });
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
      var snackBar = SnackBar(
        content: Text(
          err.toString().substring(30),
          style: ralewayStyle(15),
        ),
      );
      _scaffoldKey.currentState!.showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(color: Color(0xFFEFD5)),
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 20,
                    ),
                    Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 45.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange,
                        fontFamily: 'Pacifico-Regular',
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 35, right: 35),
                      child: Text(
                        "Welcome back friend, do login into your account to start connecting with others.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontFamily: 'FredokaOne-Regular',
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 25,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: TextFormField(
                        controller: _usernameController,
                        style: montserratStyle(18, Colors.black),
                        decoration: InputDecoration(
                          hintText: "Full Name",
                          labelText: "Jane Doe",
                          hintStyle: ralewayStyle(
                            20,
                            Colors.black,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        style: montserratStyle(18, Colors.black),
                        decoration: InputDecoration(
                          hintText: "Email",
                          labelText: "your_email@email.com",
                          hintStyle: ralewayStyle(
                            20,
                            Colors.black,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        style: montserratStyle(18, Colors.black),
                        decoration: InputDecoration(
                          hintText: "Password",
                          labelText: "******",
                          hintStyle: ralewayStyle(
                            20,
                            Colors.black,
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                      onTap: signUpUser,
                      child: Container(
                        height: 50,
                        width: 300,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: GradientColors.orange,
                            ),
                            borderRadius: BorderRadius.circular(20)),
                        child: Center(
                            child: Text(
                          "Sign up now!",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.black,
                            fontFamily: 'FredokaOne-Regular',
                          ),
                        )),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AccountLogin()));
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                            TextSpan(
                              text: 'Sign in',
                              style: TextStyle(
                                  color: Colors.orange,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

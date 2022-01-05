import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:msync/accounts/login.dart';
import 'package:msync/accounts/register.dart';

class IntroductionAccount extends StatefulWidget {
  IntroductionAccount({Key? key}) : super(key: key);

  @override
  _IntroductionAccountState createState() => _IntroductionAccountState();
}

class _IntroductionAccountState extends State<IntroductionAccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage('assets/icons/logo.png'),
                  ),
                ),
              ),
              Text(
                "mesync",
                style: TextStyle(
                  fontSize: 55.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontFamily: 'Pacifico-Regular',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontFamily: 'FredokaOne-Regular',
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "Start yor calls and reachout for better experience through socilization",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                    fontFamily: 'FredokaOne-Regular',
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (ctx) => AccountLogin()));
                      },
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
                          "LOG IN",
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white,
                            fontFamily: 'FredokaOne-Regular',
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => AccountRegister()));
                },
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Sign up',
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
      ),
    );
  }
}

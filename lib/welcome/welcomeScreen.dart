import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:msync/accounts/introduction.dart';
import 'package:msync/constants.dart';

class WelcomeScreen extends StatefulWidget {
  WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: IntroductionScreen(
        globalBackgroundColor: Colors.lime[50],
        nextColor: Colors.orange,
        skipColor: Colors.orange,
        dotsDecorator: DotsDecorator(
          activeColor: Colors.orange,
        ),
        pages: [
          PageViewModel(
            title: "Hello!",
            body:
                "Welcome to Mesync, a video-audio call chat app. We're good to go.",
            decoration: PageDecoration(
              pageColor: Colors.lime[50],
              bodyTextStyle: ralewayStyle(20, Colors.black),
              titleTextStyle:
                  montserratStyle(40, Colors.black, FontWeight.bold),
            ),
            image: Center(child: new Image.asset("assets/images/second.png")),
          ),
          PageViewModel(
            title: "Create & Join Meetings",
            body: "Initiate calls and join video calls via your Mesync code.",
            decoration: PageDecoration(
              bodyTextStyle: ralewayStyle(20, Colors.black),
              titleTextStyle:
                  montserratStyle(40, Colors.black, FontWeight.bold),
            ),
            image: Center(child: new Image.asset("assets/images/first.png")),
          ),
          PageViewModel(
            title: "Security & Privacy",
            body: "All calls are encrypted  end to end.",
            decoration: PageDecoration(
              bodyTextStyle: ralewayStyle(20, Colors.black),
              titleTextStyle:
                  montserratStyle(40, Colors.black, FontWeight.bold),
            ),
            image: Center(child: new Image.asset("assets/images/third.png")),
          ),
        ],
        onDone: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => IntroductionAccount()));
        },
        onSkip: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => IntroductionAccount()));
        },
        showSkipButton: true,
        skip: Text(
          "Skip",
          style: ralewayStyle(20, Colors.orange),
        ),
        next: const Icon(Icons.arrow_forward_ios_rounded),
        done: Text(
          "Done",
          style: ralewayStyle(20, Colors.orange),
        ),
      ),
    );
  }
}

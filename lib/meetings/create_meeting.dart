import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:msync/constants.dart';
import 'package:uuid/uuid.dart';

class CreateMeeting extends StatefulWidget {
  CreateMeeting({Key? key}) : super(key: key);

  @override
  _CreateMeetingState createState() => _CreateMeetingState();
}

class _CreateMeetingState extends State<CreateMeeting> {
  String code = "";
  var isVis = false;

  generateMeetingCode() {
    setState(() {
      code = Uuid().v1().substring(0, 6);
      isVis = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF242424),
      appBar: AppBar(
        backgroundColor: Color(0xFF242424),
        elevation: 0,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(top: 20, left: 10),
            child: Text(
              "Back",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        centerTitle: true,
        title: Text(
          "create meeting",
          style: TextStyle(
            fontSize: 27.0,
            fontWeight: FontWeight.bold,
            color: Colors.orange,
            fontFamily: 'Pacifico-Regular',
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Create a code to create a meeting!",
              style: montserratStyle(20, Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          isVis == true
              ? Container(
                  decoration: BoxDecoration(color: grey.withOpacity(0.05)),
                  height: 80,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Code: ",
                        style: ralewayStyle(30, Colors.white),
                      ),
                      Text(
                        code,
                        style: montserratStyle(30, Colors.red, FontWeight.w700),
                      ),
                    ],
                  ),
                )
              : Container(),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: generateMeetingCode,
            child: Container(
              width: size.width * 0.9,
              height: 50,
              decoration: BoxDecoration(
                color: primary,
                borderRadius: BorderRadius.circular(15),
                gradient: LinearGradient(
                  colors: GradientColors.orange,
                ),
              ),
              child: Center(
                child: Text(
                  "Generate Code",
                  style: montserratStyle(20, Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

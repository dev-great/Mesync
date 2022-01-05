import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:msync/constants.dart';
import 'package:msync/meetings/create_meeting.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _controller = TextEditingController();
  TextEditingController roomController = TextEditingController();
  bool isVideoOff = true;
  bool isAudioMuted = true;
  String username = "";
  bool isData = false;
  bool isSwitchedAudio = true;
  bool isSwitchedVideo = true;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    var uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot data = await userCollection.doc(uid).get();
    setState(() {
      username = data["username"];
      isData = true;
    });
  }

  joinMeeting() async {
    try {
      Map<FeatureFlagEnum, bool> featureeFlags = {
        FeatureFlagEnum.WELCOME_PAGE_ENABLED: false,
      };
      if (Platform.isAndroid) {
        featureeFlags[FeatureFlagEnum.CALL_INTEGRATION_ENABLED] = false;
      } else if (Platform.isIOS) {
        featureeFlags[FeatureFlagEnum.PIP_ENABLED] = false;
      }

      var options = JitsiMeetingOptions(room: roomController.text)
        ..userDisplayName = _controller.text == "" ? username : _controller.text
        ..audioMuted = isAudioMuted
        ..videoMuted = isVideoOff
        ..featureFlags.addAll(featureeFlags);

      await JitsiMeet.joinMeeting(options);
    } catch (err) {
      print(err);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFF242424),
      appBar: getAppBar(),
      body: SingleChildScrollView(child: getBody()),
    );
  }

  PreferredSizeWidget? getAppBar() {
    return AppBar(
      backgroundColor: Color(0xFF242424),
      elevation: 0,
      leading: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => CreateMeeting()));
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 10),
          child: Text(
            "Start",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        "mesync",
        style: TextStyle(
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
          color: Colors.orange,
          fontFamily: 'Pacifico-Regular',
        ),
      ),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 20,
        ),
        Container(
          height: 60,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: size.width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: PinCodeTextField(
                    controller: roomController,
                    backgroundColor: grey.withOpacity(0.01),
                    appContext: context,
                    textStyle: TextStyle(color: Colors.white),
                    autoDisposeControllers: false,
                    length: 6,
                    onChanged: (value) {},
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.box,
                      inactiveColor: grey.withOpacity(0.3),
                      selectedColor: Colors.orange,
                      activeFillColor: Colors.orange,
                      selectedFillColor: Colors.orange,
                      errorBorderColor: Colors.red,
                      disabledColor: grey.withOpacity(0.3),
                      activeColor: Colors.green,
                    ),
                    animationDuration: Duration(microseconds: 300),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Join with a mesync pincode",
          style: TextStyle(
              color: Colors.orange,
              fontSize: 16,
              fontFamily: 'FredokaOne-Regular'),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: size.width * 0.8,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 3,
                    ),
                    child: TextFormField(
                      controller: _controller,
                      cursorColor: primary,
                      style: montserratStyle(20),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText:
                            "Username (this will be visible in the meeting)",
                        labelStyle: ralewayStyle(
                            15.0, Color(0xFFcfcfcf).withOpacity(0.6)),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: joinMeeting,
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
                "Join Meeting",
                style: montserratStyle(20, Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Text(
            "If you recieved an invitation link, tab on the link again to join the meeting",
            style: TextStyle(color: grey.withOpacity(0.6), height: 1.3),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 20),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "JOIN OPTIONS",
              style: TextStyle(color: grey.withOpacity(0.6), height: 1.3),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Don't Connect To Audio",
                  style: TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeColor: Colors.orange,
                  value: isAudioMuted,
                  onChanged: (val) {
                    setState(() {
                      isAudioMuted = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          decoration: BoxDecoration(color: grey.withOpacity(0.03)),
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Turn Off My Video",
                  style: TextStyle(
                      color: grey,
                      height: 1.3,
                      fontSize: 15,
                      fontWeight: FontWeight.w600),
                ),
                Switch(
                  activeColor: Colors.orange,
                  value: isVideoOff,
                  onChanged: (val) {
                    setState(() {
                      isVideoOff = val;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

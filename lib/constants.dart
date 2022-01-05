import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

TextStyle ralewayStyle(double size,
    [Color? color, FontWeight fontWeight = FontWeight.w700]) {
  return GoogleFonts.raleway(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}

const Color black = Color(0xFF000000);
const Color primary = Color(0xFF0e72ec);
const Color red = Color(0xFFd72c21);
const Color green = Color(0xFF22d759);
const Color grey = Color(0xFFcfcfcf);

TextStyle montserratStyle(double size,
    [Color? color, FontWeight fontWeight = FontWeight.w700]) {
  return GoogleFonts.montserrat(
    fontSize: size,
    color: color,
    fontWeight: fontWeight,
  );
}

CollectionReference userCollection =
    FirebaseFirestore.instance.collection("users");

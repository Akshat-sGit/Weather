import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempTextStyle = GoogleFonts.poppins(
  fontSize: 40.0,
  fontWeight: FontWeight.bold, 
);

TextStyle kMessageTextStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  fontWeight: FontWeight.bold, 
);

TextStyle kButtonTextStyle = GoogleFonts.poppins(
  fontSize: 20.0,
  color: Colors.white, 
  fontWeight: FontWeight.w600,
);

TextStyle kHeadingStyle = GoogleFonts.poppins(
  fontSize: 30.0, 
  fontWeight: FontWeight.bold, 
  color: Colors.black, 
);

TextStyle kConditionTextStyle = GoogleFonts.poppins(
  fontSize: 100.0,
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.black,
  hintText: 'Enter City Name',
  hintStyle: GoogleFonts.poppins(
    color: Colors.grey,
  ),
  border:const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(20.0),
    ),
    borderSide: BorderSide.none,
  ),
);

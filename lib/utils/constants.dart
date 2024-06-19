import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle kTempTextStyle = GoogleFonts.poppins(
  fontSize: 100.0,
);

TextStyle kMessageTextStyle = GoogleFonts.poppins(
  fontSize: 60.0,
);

TextStyle kButtonTextStyle = GoogleFonts.poppins(
  fontSize: 30.0,
);

TextStyle kConditionTextStyle = GoogleFonts.poppins(
  fontSize: 100.0,
);

InputDecoration kTextFieldInputDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  icon:const Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  hintText: 'Enter City Name',
  hintStyle: GoogleFonts.poppins(
    color: Colors.grey,
  ),
  border:const OutlineInputBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(10.0),
    ),
    borderSide: BorderSide.none,
  ),
);

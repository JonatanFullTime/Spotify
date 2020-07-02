import 'package:flutter/material.dart';

final textInputDecorationLog = InputDecoration(
  fillColor: Colors.grey.withOpacity(0.4),
  filled: true,
  hintStyle: TextStyle(color: Colors.grey),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.05), width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2.0),
  ),
);

final textInputDecorationCad = InputDecoration(
  fillColor: Colors.grey.withOpacity(0.4),
  filled: true,
  hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.grey.withOpacity(0.05), width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.green.withOpacity(0.5), width: 2.0),
  ),
);

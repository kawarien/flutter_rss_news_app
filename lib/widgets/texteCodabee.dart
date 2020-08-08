import 'package:flutter/material.dart';

class TexteCodabee extends Text {

  TexteCodabee(String data, {textAlign: TextAlign.center, color: Colors.indigo, fontSize: 15.0, fontStyle: FontStyle.normal}):
        super(
          data ?? "",
          textAlign: textAlign,
          style: new TextStyle(
              color: color,
              fontSize: fontSize,
              fontStyle: fontStyle
          )
      );
}
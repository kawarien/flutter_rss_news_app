import 'package:flutter/material.dart';
import 'texteCodabee.dart';

class Chargement extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Center(
      child: new TexteCodabee("Chargement en cours...",
        fontStyle: FontStyle.italic,
        fontSize: 30.0,
      ),
    );
  }

}
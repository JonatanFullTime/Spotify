import 'package:flutter/material.dart';
import 'package:spotify/screens/autenticacao/cadastro.dart';
import 'package:spotify/screens/autenticacao/login.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool showSignIn = true;
  void toggleView() {
    //print(showSignIn.toString());
    setState(() => showSignIn = !showSignIn);
  }

  @override
  Widget build(BuildContext context) {
    if (showSignIn) {
      return login(toggleView: toggleView);
    } else {
      return cadastro(toggleView: toggleView);
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify/models/user.dart';
import 'package:spotify/screens/autenticacao/authenticate.dart';
import 'package:spotify/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}

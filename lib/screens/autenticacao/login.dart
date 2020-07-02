import 'package:flutter/material.dart';
import 'package:spotify/reutilizar/constante.dart';
import 'package:spotify/services/auth.dart';

class login extends StatefulWidget {
  final Function toggleView;
  login({this.toggleView});

  @override
  _loginState createState() => _loginState();
}

final AuthService _auth = AuthService();

class _loginState extends State<login> {
  bool val = false;
  onSwitchValueChanged(bool LembrarDeMim) {
    setState(() {
      val = LembrarDeMim;
    });
  }

  final _formKey = GlobalKey<FormState>();

  // state field state
  String email = '';
  String senha = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text(''),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Cadastrar-se'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: Container(
        height: 700,
        child: Wrap(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                    child: Image.network(
                      "https://images.squarespace-cdn.com/content/v1/57f0192a2994ca2033facf8c/1517179485564-3LLFO30GDRSJP3SFBFQA/ke17ZwdGBToddI8pDm48kMLevdbIg2saM6aMryEh8FHlfiSMXz2YNBs8ylwAJx2qLijIv1YpVq4N1RMuCCrb3iJz4vYg48fcPCuGX417dnZKWuSQ8AqmKGSgXJ2s1MDhJb0xGCd8bO37W4WEbsxsLAoyyEsAbPHhHcQMU6bWQFI/spotify+logo.png",
                      width: 170,
                    ),
                  ),
                  ButtonTheme(
                    minWidth: 305.0,
                    height: 40.0,
                    child: RaisedButton(
                      onPressed: () => {
                        print("pressionei o botão"),
                      },
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                      child: Text(
                        "ENTRAR COM O FACEBOOK",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ), //Text
                      color: Colors.indigo,
                    ), //RaisedButton
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Text(
                      "———————————— OU ————————————",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 56.0, right: 56.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        validator: (val) =>
                            val.isEmpty ? 'Por favor, digite um email.' : null,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        focusNode: FocusNode(),
                        autofocus: false,
                        style: TextStyle(color: Colors.white),
                        decoration: textInputDecorationLog.copyWith(
                            hintText: 'Usuário'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, left: 56.0, right: 56.0),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: TextFormField(
                        validator: (val) => val.length < 6
                            ? 'A senha deve conter no mínimo 6 caracteres.'
                            : null,
                        onChanged: (val) {
                          setState(() => senha = val);
                        },
                        autofocus: false,
                        obscureText: true,
                        focusNode: FocusNode(),
                        style: TextStyle(color: Colors.white),
                        decoration:
                            textInputDecorationLog.copyWith(hintText: 'Senha'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 24.0, left: 56.0, right: 56.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "LEMBRAR DE MIM?",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Switch(
                          activeColor: Colors.green,
                          value: val,
                          // ignore: non_constant_identifier_names
                          onChanged: (LembrarDeMim) {
                            onSwitchValueChanged(LembrarDeMim);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30.0, left: 56.0, right: 56.0),
                    child: ButtonTheme(
                      minWidth: 150.0,
                      height: 45.0,
                      child: RaisedButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            dynamic result = await _auth
                                .signInWithEmailAndPassword(email, senha);
                            if (result == null) {
                              setState(() {
                                error =
                                    'Could not sign in with those credentials';
                              });
                            }
                          }
                        },

                        shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0),
                        ),
                        child: Text(
                          "ENTRAR",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ), //Text
                        color: Colors.green,
                      ), //RaisedButton
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 56.0, right: 56.0),
              width: 400,
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  GestureDetector(
                    onTap: () async {
                      dynamic result = await _auth.signInAnon();
                      if (result == null) {
                        print('Error signing in');
                      } else {
                        print('Signed in');
                        print(result.uid);
                      }
                    },
                    child: Text(
                      "PREFERÊNCIAS",
                      style: TextStyle(color: Colors.grey, fontSize: 16.0),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

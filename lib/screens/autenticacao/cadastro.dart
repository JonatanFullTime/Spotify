import 'package:flutter/material.dart';
import 'package:spotify/reutilizar/constante.dart';
import 'package:spotify/services/auth.dart';

class cadastro extends StatefulWidget {
  final Function toggleView;
  cadastro({this.toggleView});

  @override
  _cadastroState createState() => _cadastroState();
}

class _cadastroState extends State<cadastro> {
  bool _term1F = false;
  bool _term2F = false;

  bool _term1 = false;
  bool _term2 = false;
  bool _term3 = false;

  List<DropdownMenuItem<String>> listMeses = [];

  List<String> meses = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String selecionado = null;

  String email = '';
  String senha = '';
  String error = '';
  String apelido = '';
  int dia;
  int mes;
  int ano;
  bool loading = false;

  _cadastroState();

  void criaLista() {
    listMeses = [];
    listMeses = meses
        .map((val) => new DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: new Text(
                  val,
                  style: TextStyle(color: Colors.grey, fontSize: 13.0),
                ),
              ),
              value: val,
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
        title: Text(
          'Cadastro',
          style: TextStyle(color: Colors.black),
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Login'),
            onPressed: () => widget.toggleView(),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          height: 800,
          width: 500,
          margin: EdgeInsets.only(left: 16.0, right: 32.0),
          child: Wrap(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 24.0),
                      child: Image.network(
                        "https://images.squarespace-cdn.com/content/v1/57f0192a2994ca2033facf8c/1517179485564-3LLFO30GDRSJP3SFBFQA/ke17ZwdGBToddI8pDm48kMLevdbIg2saM6aMryEh8FHlfiSMXz2YNBs8ylwAJx2qLijIv1YpVq4N1RMuCCrb3iJz4vYg48fcPCuGX417dnZKWuSQ8AqmKGSgXJ2s1MDhJb0xGCd8bO37W4WEbsxsLAoyyEsAbPHhHcQMU6bWQFI/spotify+logo.png",
                        width: 150,
                      ),
                    ),
                    ButtonTheme(
                      minWidth: 400.0,
                      height: 30.0,
                      child: RaisedButton(
                        onPressed: () => {
                          print("pressionei o botão"),
                        },
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0)),
                        child: Text(
                          "ENTRAR COM O FACEBOOK",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ), //Text
                        color: Colors.indigo,
                      ), //RaisedButton
                    ),
                    Row(
                      children: <Widget>[
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Checkbox(
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                _term1F = value;
                              });
                            },
                            value: _term1F,
                          ),
                        ),
                        Text(
                          "Aceito a ",
                          style: TextStyle(color: Colors.grey, fontSize: 13.0),
                        ),
                        Text(
                          "os termos de condição.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 13.0),
                        )
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Theme(
                          data: Theme.of(context).copyWith(
                            unselectedWidgetColor: Colors.white,
                          ),
                          child: Checkbox(
                            activeColor: Colors.green,
                            onChanged: (bool value) {
                              setState(() {
                                _term2F = value;
                              });
                            },
                            value: _term2F,
                          ),
                        ),
                        RichText(
                          text: new TextSpan(
                            // Note: Styles for TextSpans must be explicitly defined.
                            // Child text spans will inherit styles from parent
                            style: new TextStyle(
                              fontSize: 13.0,
                              color: Colors.grey,
                            ),
                            children: <TextSpan>[
                              new TextSpan(
                                  text:
                                      'Autorizo minhas informações pessoais a se-\nrem coletadas, processadas e utilizadas con-\nforme estabelecido na '),
                              new TextSpan(
                                  text: 'a política de privacida-\nde.',
                                  style: new TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 13.0)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 12.0),
                      child: Text(
                        "——————————— OU  ———————————",
                        style: TextStyle(color: Colors.grey, fontSize: 16.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Container(
                        height: 45,
                        child: TextFormField(
                          cursorColor: Colors.black,
                          autofocus: false,
                          focusNode: FocusNode(),
                          validator: (val) => val.isEmpty
                              ? 'Por favor, digite um email.'
                              : null,
                          onChanged: (val) {
                            setState(() => email = val);
                          },
                          style: TextStyle(color: Colors.white, fontSize: 13.0),
                          decoration: textInputDecorationCad.copyWith(
                            hintText: " Email",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 45,
                          child: TextFormField(
                            obscureText: true,
                            autofocus: false,
                            focusNode: FocusNode(),
                            validator: (val) => val.length < 6
                                ? 'A senha deve conter no mínimo 6 caracteres.'
                                : null,
                            onChanged: (val) {
                              setState(() => senha = val);
                            },
                            enabled: true,
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                            decoration: textInputDecorationCad.copyWith(
                              hintText: ' Senha',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Container(
                          height: 45,
                          child: TextField(
                            cursorColor: Colors.black,
                            autofocus: false,
                            focusNode: FocusNode(),
                            onChanged: (val) {
                              setState(() => apelido = val);
                            },
                            style:
                                TextStyle(color: Colors.white, fontSize: 13.0),
                            decoration: textInputDecorationCad.copyWith(
                              hintText: " Como devemos chamar você?",
                            ),
                          ),
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "Data de nascimento:",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Container(
                                width: 90,
                                height: 35,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextField(
                                    toolbarOptions: ToolbarOptions(),
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    focusNode: FocusNode(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.withOpacity(0.4),
                                      filled: true,
                                      hintText: "  Dia",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ),
                            Spacer(),
                            Container(
                              width: 130,
                              height: 35,
                              color: Colors.grey.withOpacity(0.4),
                              child: DropdownButtonHideUnderline(
                                  child: new DropdownButton(
                                      value: selecionado,
                                      items: listMeses,
                                      hint: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 16.0),
                                        child: new Text(
                                          'Mês',
                                          style: TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15.0,
                                          ),
                                        ),
                                      ),
                                      iconSize: 30.0,
                                      elevation: 16,
                                      onChanged: (value) {
                                        selecionado = value;
                                        setState(() {});
                                      })),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10.0, bottom: 10.0),
                              child: Container(
                                width: 90,
                                height: 35,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: TextField(
                                    cursorColor: Colors.black,
                                    autofocus: false,
                                    focusNode: FocusNode(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13.0),
                                    decoration: InputDecoration(
                                      fillColor: Colors.grey.withOpacity(0.4),
                                      filled: true,
                                      hintText: "  Ano",
                                      hintStyle: TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                    keyboardType: TextInputType.number,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                activeColor: Colors.green,
                                onChanged: (bool value) {
                                  setState(() {
                                    _term1 = value;
                                  });
                                },
                                value: _term1,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text(
                                "Compartilhar meus dados de registro com \nos provedores de conteúdo do Spotify para \nfins de marketing.",
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 13.0),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                activeColor: Colors.green,
                                onChanged: (bool value) {
                                  setState(() {
                                    _term2 = value;
                                  });
                                },
                                value: _term2,
                              ),
                            ),
                            Text(
                              "Aceito a ",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13.0),
                            ),
                            Text(
                              "os termos de condição.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 13.0),
                            )
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Theme(
                              data: Theme.of(context).copyWith(
                                unselectedWidgetColor: Colors.white,
                              ),
                              child: Checkbox(
                                activeColor: Colors.green,
                                onChanged: (bool value) {
                                  setState(() {
                                    _term3 = value;
                                  });
                                },
                                value: _term3,
                              ),
                            ),
                            RichText(
                              text: new TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: new TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.grey,
                                ),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text:
                                          'Autorizo minhas informações pessoais a se-\nrem coletadas, processadas e utilizadas con-\nforme estabelecido na '),
                                  new TextSpan(
                                      text: 'a política de privacida-\nde.',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 13.0)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ButtonTheme(
                        minWidth: 400.0,
                        height: 40.0,
                        child: RaisedButton(
                            shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0)),
                            child: Text(
                              "ENTRE NO SPOTIFY",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 13),
                            ), //Text
                            color: Colors.green,
                            onPressed: () async {
                              if (_formKey.currentState.validate()) {
                                dynamic result = await _auth
                                    .registerWithEmailAndPassword(email, senha);
                                if (result == null) {
                                  setState(() {
                                    error = 'Please supply a valid email';
                                  });
                                }
                              }
                            }), //Raised
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'connection.dart';
import 'lista.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Formulario con Flutter',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: formulario());
  }
}

class formulario extends StatefulWidget {

  MyFormulario createState() {
    return MyFormulario();
  }
}

class MyFormulario extends State<formulario> {
  final _formKey = GlobalKey<FormState>();
  final myControllerUser = TextEditingController();
  final myControllerPassword = TextEditingController();
  String name = 'Drosur App';
  bool search=false;

  @override
  void dispose() {
    myControllerUser.dispose();
    myControllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue[100],
        appBar: AppBar(
          centerTitle: true,
          title: Text(name),
        ),
        body: Builder(
            builder: (context) => Form(
                      key: _formKey,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            TextFormField(
                              autocorrect: true,
                              decoration:InputDecoration(
                                  labelText: 'Por favor introduzca su email',
                              ),
                              maxLines: 1,
                              controller: myControllerUser,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                Pattern pattern =
                                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                RegExp regex = new RegExp(pattern);
                                if (!regex.hasMatch(value))
                                  return 'Email no valido';
                              },
                            ),
                            TextFormField(
                              obscureText: true,
                              maxLines: 1,
                              decoration:InputDecoration(
                                  labelText: 'Porfavor introduzca su contraseña'
                              ),
                              controller: myControllerPassword,
                              keyboardType: TextInputType.text,
                              validator: (value) {
                                if (value.length < 5) {
                                  return 'La contraseña debe tener al menos 5 caracteres';
                                }
                              },
                            ),
                            Center(
                                child: Padding(
                              padding: EdgeInsets.symmetric(vertical: 10.0),
                              child: search ? Icon(Icons.autorenew)
                                  :
                              RaisedButton(
                                color: Colors.blue[600],
                                onPressed: () {
                                  if (_formKey.currentState.validate()) {
                                    Scaffold.of(context).showSnackBar(SnackBar(
                                      content: Text('Procesando datos'),
                                    ));

                                    search=true;

                                     Connection.login(myControllerUser.text,
                                            myControllerPassword.text)
                                        .then((respuesta) {
                                      search=false;
                                        if(respuesta==null)
                                          return;

                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) => Lista()),
                                      );

                                    }).catchError((error){
                                        search=false;
                                    });
                                  }
                                },
                                child: Text('Submit '),
                              ),
                            )),
                          ],
                        ),
                      )),
                ));
  }
}

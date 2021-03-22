import 'package:flutter/material.dart';
import 'package:prawo_jazdy_app/main.dart';
import 'package:prawo_jazdy_app/util/session.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'LOGOWANIE',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            // image: DecorationImage(
            //   image: AssetImage('assets/images/login.jpg'),
            //   fit: BoxFit.cover,
            // ),
            ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
              child: Container(
                width: 300.0,
                height: 200.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextFormField(
                      controller: usernameController,
                      decoration:
                          const InputDecoration(hintText: "Podaj login"),
                    ),
                    TextFormField(
                      controller: passwordController,
                      decoration:
                          const InputDecoration(hintText: "Podaj hasło"),
                      obscureText: true,
                    ),
                    Container(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.blue,
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Session().login({
                            'username': usernameController.text,
                            'password': passwordController.text
                          }).then((value) => {
                                if (value)
                                  {
                                    Navigator.pushNamedAndRemoveUntil(
                                        context, MapRoute, (route) => false)
                                  }
                                else
                                  {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: false,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Błędne dane'),
                                            content: Container(
                                              child: Text(
                                                  'Wprowadzony login lub hasło są błędne. Prosimy spróbować ponownie.'),
                                            ),
                                            actions: [
                                              TextButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text('OK')),
                                            ],
                                          );
                                        })
                                  }
                              });
                        },
                        child: Text('ZALOGUJ'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

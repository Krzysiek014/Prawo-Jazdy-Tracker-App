import 'package:flutter/material.dart';
import 'package:prawo_jazdy_app/util/session.dart';

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class Register extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'REJESTRACJA',
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/images/login.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
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
                          Session().post('userApi/register', {
                            'username': usernameController.text,
                            'password': passwordController.text
                          });
                          // print("RETURN: " + Session().get('map/lessons'));
                        },
                        child: Text('ZAREJESTRUJ'),
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

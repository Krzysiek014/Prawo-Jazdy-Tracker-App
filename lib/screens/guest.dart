import 'package:flutter/material.dart';
import 'package:prawo_jazdy_app/main.dart';

class Guest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PRAWO JAZDY',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, LoginRoute),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 20.0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    )
                  ],
                ),
                constraints: BoxConstraints.expand(
                  width: 300.0,
                  height: 60.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('LOGOWANIE'),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, RegisterRoute),
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 20.0, 0, 0),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 20,
                    )
                  ],
                ),
                constraints: BoxConstraints.expand(
                  width: 300.0,
                  height: 60.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('REJESTRACJA'),
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

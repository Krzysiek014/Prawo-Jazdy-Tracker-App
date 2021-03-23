import 'package:flutter/material.dart';
import 'package:prawo_jazdy_app/style.dart';
import 'package:prawo_jazdy_app/util/session.dart';
import 'screens/guest.dart';
import 'screens/login.dart';
import 'screens/map.dart';
import 'screens/profile.dart';
import 'screens/register.dart';

const GuestRoute = '/';
const LoginRoute = '/login';
const RegisterRoute = '/register';
const MapRoute = '/map';
const ProfileRoute = '/profile';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: _routes(),
      title: 'Flutter Demo',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          textTheme: TextTheme(
            headline6: AppBarTextStyle,
          ),
        ),
        textTheme: TextTheme(
          bodyText2: RegLogButton,
        ),
      ),
    );
  }

  RouteFactory _routes() {
    return (settings) {
      final Map<String, dynamic> arguments = settings.arguments;
      Widget screen;
      switch (settings.name) {
        case GuestRoute:
          if (Session().verifyCookie()) {
            screen = MapHome();
          } else {
            screen = Guest();
          }
          break;
        case LoginRoute:
          screen = Login();
          break;
        case RegisterRoute:
          screen = Register();
          break;
        case MapRoute:
          screen = MapHome();
          break;
        case ProfileRoute:
          screen = Profile();
          break;
        default:
          return null;
      }
      return MaterialPageRoute(builder: (BuildContext context) => screen);
    };
  }
}

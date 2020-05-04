import 'package:covid19/bloc/corona_bloc.dart';
import 'package:covid19/ui/coronaHome.dart';
import 'package:covid19/ui/screens/preventionScreens.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:covid19/repository/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'COVID-19 Tracker',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(
          fontFamily: 'Montserrat',
          bodyColor: Colors.black87,
        )
      ),
      routes: {
        '/symptoms': (context) => SymptomsScreen(),
        '/prevention': (context) => PreventionScreen(),
        '/about': (context) => AboutScreen(),
        
      },
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => CoronaBloc(coronaRepository: CoronaRepository(
          coronaApiClient: CoronaApiClient(
            httpClient: http.Client()
          )
        )),
        child: CoronaHome()),
    );
  }
}
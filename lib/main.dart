import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odc_movie_theater/cubit/authentication/auth_cubit.dart';
import 'cubit/main/main_cubit.dart';
import 'view/componentes/auth/components.dart';
import 'view/pages/authentication/splash.dart';
import 'view_model/network/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MainCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primarySwatch: Colors.red,
            appBarTheme: const AppBarTheme(
              centerTitle: true,
              backgroundColor: Colors.white,
              elevation: 0.0,
            )),
        home: const Splash(),
      ),
    );
  }
}

class Task extends StatefulWidget {
  const Task({Key? key}) : super(key: key);

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  var rng = Random();
  var res = [];

  List<Color> colorList = [];

  @override
  void initState() {
    for (var i = 0; i < 6; i++) {
      res.add(rng.nextInt(100));
    }
    res.sort();
  }

  List<Widget> resWidget = [];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Task'),
      ),
      body: Column(children: [
        Container(
          color: Colors.white,
          height: 630,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: resWidget,
          ),
        ),
        buildButton(
            name: 'ADD',
            onPress: () {
              setState(() {
                resWidget.add(show(
                  height: (height / i + 1),
                  width: (width / i + 1),
                  num: res[i],
                ));
                i++;
              });
            })
      ]),
    );
  }

  Widget show({required num, required width, required height}) {
    return Container(
      height: 65,
      width: 65,
      color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
      child: Center(
          child: Text(
        '$num',
        style: TextStyle(fontSize: 25, color: Colors.black),
      )),
    );
  }
}

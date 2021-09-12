import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mobx_aula/screens/screen_home.dart';

import 'controller.dart';


void main() {
  runApp(MultiProvider(
    //create: (_) => Controller(),
    providers: [
      Provider<Controller>(
          create: (_) => Controller(),
      ),
    ],
    child: MaterialApp(
      home: ScreenHome(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}



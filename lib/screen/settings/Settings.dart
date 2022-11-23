import "package:flutter/material.dart";
import 'package:recipes/components/drawer/DrawerNavigation.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        //estou usando  o metodo pushReplacementNamed por isso preciso do drawer aqui
        drawer: const DrawerNavigation(),
        body: Text("ola mundo"));
  }
}

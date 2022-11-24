import "package:flutter/material.dart";
import 'package:recipes/components/drawer/DrawerNavigation.dart';
import 'package:recipes/model/Settings.dart';

class Settings extends StatefulWidget {
  late Function(SettingsModel settins) filterMeals;
  late SettingsModel settings;

  Settings({required this.filterMeals, required this.settings, super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  late SettingsModel settingsModel;

  //ciclo de vida assim que e criado a tela
  @override
  void initState() {
    super.initState();
    settingsModel = widget.settings;
  }

  Widget makeSwitch(
      {required value,
      required void Function(bool status) onChanged,
      required String title,
      required String subTitle}) {
    return SwitchListTile.adaptive(
      value: value,
      onChanged: (value) =>
          {onChanged(value), widget.filterMeals(settingsModel)},
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w300,
          color: Colors.black54,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: const TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w300,
          color: Colors.grey,
        ),
      ),
    );
  }

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
        body: ListView(
          children: [
            makeSwitch(
                value: settingsModel.isGlutenFree,
                onChanged: (status) => setState(() {
                      settingsModel.isGlutenFree = status;
                    }),
                title: "Sem Glutém",
                subTitle: "Só exibe refeições sem gluten!"),
            makeSwitch(
                value: settingsModel.isLactoseFree,
                onChanged: (status) => setState(() {
                      settingsModel.isLactoseFree = status;
                    }),
                title: "Sem Lactose",
                subTitle: "Só exibe refeições sem lactose!"),
            makeSwitch(
                value: settingsModel.isVegan,
                onChanged: (status) => setState(() {
                      settingsModel.isVegan = status;
                    }),
                title: "Vegana",
                subTitle: "Só exibe refeições vegana!")
          ],
        ));
  }
}

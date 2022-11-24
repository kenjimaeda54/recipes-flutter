class SettingsModel {
  late bool isGlutenFree;
  late bool isLactoseFree;
  late bool isVegan;

  SettingsModel(
      {this.isLactoseFree = false,
      this.isGlutenFree = false,
      this.isVegan = false});
}

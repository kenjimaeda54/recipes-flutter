import 'package:flutter/material.dart';
import 'package:recipes/utils/appRoutes.dart';

class DrawerNavigation extends StatelessWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  Widget listLinksWidget({required String label,
    required IconData icons,
    required Function() navigation}) {
    return ListTile(
      leading: Icon(
        icons,
        size: 26,
      ),
      title: Text(
        label,
        style: const TextStyle(
            fontFamily: 'RobotoCondensed',
            fontSize: 24,
            fontWeight: FontWeight.bold),
      ),
      onTap: navigation,
    );
  }

  @override
  Widget build(BuildContext context) {
    void handleNavigatior(String route) {
      //ja que estamos usando drawer o ideal nao e usar pushNamed
      //porque com pushNamed estarei colocando mais uma pilha assim as telas
      //estaram sempre somando ao invez de realmetne revmoer com pop que seria no botao de voltar

      //com o metodo pushReplacementNamed estarei substituindo a rota anterior
      //assim a as telas nao haveram botao de voltar , para voltar as telas anteriores
      //e so chamar este compoennte nas telas que deseja voltar
      Navigator.of(context).pushReplacementNamed(route);
    }

    return Drawer(
      child: Column(children: [
        Container(
          height: 200,
          color: Theme
              .of(context)
              .colorScheme
              .secondary,
          alignment: Alignment.bottomCenter,
          width: double.infinity,
          padding: const EdgeInsets.all(10),
          child: Text(
            "Vamos cozinhar?",
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme
                  .of(context)
                  .primaryColor,
            ),
          ),
        ),
        const SizedBox(height: 20),
        listLinksWidget(
            label: "Refeicões",
            icons: Icons.restaurant,
            navigation: () => handleNavigatior(AppRoutes.home)),
        listLinksWidget(
            label: "Configurações",
            icons: Icons.settings,
            navigation: () => handleNavigatior(AppRoutes.settings))
      ]),
    );
  }
}

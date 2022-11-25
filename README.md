# Receitas
App contendo receitas, possibilidade de filtrar por glúten, sem lactose e vegano. Também pode escolher as favoritas


## Feature
- Aprendi a lidar com rotas e nesting de rotas, aplicando drawer navigation ,stack navigation e bottom navigation
- Para criar as rotas você pode centralizar elas no próprio main.dart
- Para criar os nesting de rotas usei da seguinte esrategeia,criei um arquivo com as respectivos estilos de rotas e no main.dart referenciei esses arquivos
- Se desejar usar o  / como rota principal neste caso funciona, ele trabalha com  mesmo conceito de web, porem e possível também  criar rotas sem elas.
- Repara que main chamo um arquivo que possui estilo específico de rotas, esse arquivo o nome e TabsNavigation
- Em TabasNavigation ele possui estilo de rotas de tabs
- Para realizar de forma dinâmica a rota por tab usei uma lista de navegação, assim quando usuário clicar além de renderizar apenas uma rota, ira pintar com cor diferente a rota atual

 ```dart
 //main.dart
 
  return MaterialApp(
      title: 'Recipes',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          fontFamily: 'Raleway',
          appBarTheme: const AppBarTheme(
            color: Color.fromRGBO(206, 122, 122, 1.0),
          ),
          canvasColor: const Color.fromRGBO(254, 254, 229, 1),
          textTheme: const TextTheme(
              titleMedium: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondensed-Regular',
                  color: Colors.white)),
          colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.amber)),
      routes: {
        AppRoutes.home: (_) => TabsNavigation(recipesFavorite),
        AppRoutes.categoryMeals: (_) => CategoryMeals(mealsFilter),
        AppRoutes.mealDetails: (_) =>
            MealDetails(
                isFavoritesRecipes: _isFavorite,
                toggleFavorites: _toogleRecipesFavorite),
        AppRoutes.settings: (_) =>
            Settings(filterMeals: _filterMeals, settings: settingsModel),
      },
    );
  }
 
 
 //tabs navigation
  void initState() {
    super.initState();
    screensNavigation = [
      {"title": "Lista de categorias", "screen": const CategoryScreen()},
      {"title": "Lista de favoritos", "screen": FavoriteRecipes(widget.meals)},
    ];
  }

  int handleTabSelected(int index) {
    setState(() {
      tabSelected = index;
    });
    return index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(screensNavigation[tabSelected]["title"] as String),
      ),
      body: screensNavigation[tabSelected]["screen"] as Widget,
      drawer: const DrawerNavigation(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color.fromRGBO(206, 122, 122, 1.0),
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.white,
        onTap: handleTabSelected,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.category), label: "Categorias"),
          BottomNavigationBarItem(icon: Icon(Icons.start), label: "Favoritas"),
        ],
      ),
    );
  }
 
 
  ```
	
##
- Em rotas do tipo Drawer navigation e ideal usar pushReplacementNamed, desta maneira não  iremos criar  várias pilhas de telas
- Ao usar esse método a pilha anterior e morta, então após navega para outra tela é ideal chamar novamente o drawer para conseguir voltar
- Repara que o componente drawer e acionado tanto no TabNavigation no exemplo acima como no Settings
	
```dart

//componente drawer
 Widget build(BuildContext context) {
    void handleNavigatior(String route) {
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

//componente settings
 Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Settings",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
     
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



```
## 
- Abaixo exemplo como enviar argumentos através das rotas com  meotodo pushNamed
- Caso deseja enviar argumentos de uma rota a frente para anterior usa o método pop
- O método pushNamed tem assinatura de future, que pode ser acessado através do then, nele por calback você recebera o valor passado

```dart
//enviando argumentos
 void _navigateRoute(BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoutes.categoryMeals, arguments: category);
  }

//recebendo argumentos
final arguments = ModalRoute.of(context)?.settings.arguments as Category;

	
//enviar para uma rota anterior
// () => Navigator.of(context).pop(meal.title)

//para acessar parametro da tela a frente 
 Navigator.of(context)
        .pushNamed(AppRoutes.categoryMeals, arguments: category).then(routes{});


```

##
- Usei alguns componentes interssantes como o SliverGridDelegateWithMaxCrossAxisExtent para criar grid
- E para criar um card clicavel usei o InkWell


```dart
//
InkWell(
      //se nao colocar esse border radius ficara ao clicar um quadrado ao invez redondo
      borderRadius: BorderRadius.circular(5),
      onTap: () => _navigateRoute(context),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            gradient: LinearGradient(
              colors: [category.color.withOpacity(0.5), category.color],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )),
        child: Text(category.title),
      ),
    );

//
SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, //maximo do eixo
          mainAxisSpacing: 20, // espaco entre lees
          childAspectRatio: 3 / 2, //1 /2 => imagem ficara 1 por 2 de aultra
          crossAxisSpacing: 20,
        ),
        children: categotegoriesMock.map((it) => SingleCategory(it)).toList(),
      );


```


	
	
	
	
	
	

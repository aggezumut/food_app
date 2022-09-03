import 'package:flutter/material.dart';
import 'package:meals_app/presentation/screen/pageview_page.dart';
import 'package:meals_app/state/my_favorite_products_provider.dart';
import 'package:meals_app/state/shopping_cart_provider.dart';
import 'package:meals_app/state/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AppThemeState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppShoppingCartState(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppFavoriteProducts(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppThemeState providerTheme = Provider.of<AppThemeState>(context);

    return MaterialApp(
      theme:
          providerTheme.selecteState == true ? ThemeData.light() : ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: PageViewPage(),
    );
  }
}

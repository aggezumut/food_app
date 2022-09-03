import 'package:flutter/material.dart';
import 'package:meals_app/presentation/screen/navpages/home_screen.dart';
import 'package:meals_app/presentation/screen/navpages/basket.dart';
import 'package:meals_app/presentation/screen/navpages/favorite_page.dart';
import 'package:meals_app/presentation/screen/navpages/settings_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<dynamic> pages = [
    const HomeScreen(),
    const FavoritePage(),
    const BasketPage(),
    const SettingsPage(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed, // geçişlerde animasyon olmaması için.
        currentIndex: currentIndex, // tabBar daki bölümleri ifade ediyor.
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favorite"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}

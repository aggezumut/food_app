import 'package:flutter/material.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/presentation/screen/detail_screen.dart';
import 'package:meals_app/product/pizza_products.dart';
import 'package:meals_app/widgets/app_padding.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:meals_app/widgets/product_card.dart';

import '../../../components/explore_more.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  // with TickerProviderStateMixin ifadesini tabBar için yaptık.  (Pizza,Burger,Others yazıları ve onun sayfa geçişleri için)

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    // tabBar controller zorunlu

    return Scaffold(
      body: AppPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.menu,
                  size: 30,
                ),
                CircleAvatar(
                  backgroundImage: AssetImage("assets/images/profile.jpg"),
                  radius: 30,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            const AppText.title(
              text: "Discover",
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              indicatorColor: Colors.transparent, // altçizgi renk
              labelPadding: const EdgeInsets.only(right: 30),
              controller: _tabController,
              labelColor: kTextSecondColor,
              labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              tabs: const [
                Tab(
                  text: "Pizza",
                ),
                Tab(
                  text: "Burger",
                ),
                Tab(
                  text: "Others",
                ),
              ],
            ),
            SizedBox(
              height: 300,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Builder(
                    builder: (context) {
                      final pizzas = products.where((element) => element.productType == 1).toList();
                      // Listede ki herbir eleman için bakıyor ve productsType ları 1 olanları pizzas'a atıyor
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: pizzas.length,
                        itemBuilder: (context, index) => _pizzasBuilder(context, pizzas, index),
                      );
                    },
                  ),
                  Builder(builder: (context) {
                    final burgers = products.where((element) => element.productType == 2).toList();
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: burgers.length,
                      itemBuilder: (context, index) => _burgerBuilder(context, burgers, index),
                    );
                  }),
                  Container(
                    color: Colors.orangeAccent,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                AppText.normal(text: "Explore more"),
                AppText.subtitle(
                  text: "See all",
                  color: kPrimaryColor,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            ExploreMore(),
          ],
        ),
      ),
    );
  }

  GestureDetector _burgerBuilder(BuildContext context, List<Product> burgers, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(products: burgers[index]),
          ),
        );
      },
      child: ProductCard(
        image: burgers[index].image.toString(),
        text: burgers[index].name.toString(),
      ),
    );
  }

  GestureDetector _pizzasBuilder(BuildContext context, List<Product> pizzas, int index) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              products: pizzas[index],
            ),
            // productType meselesini eklemeden önce products[index] şelinde yazıyordum...
          ),
        );
      },
      child: ProductCard(
        image: pizzas[index].image.toString(),
        text: pizzas[index].name.toString(),
      ),
    );
  }
}

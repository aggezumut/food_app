import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/product/pizza_products.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:provider/provider.dart';
import '../../../state/my_favorite_products_provider.dart';
import '../../../widgets/app_padding.dart';
import '../detail_screen.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    AppFavoriteProducts providerFavorite = Provider.of<AppFavoriteProducts>(context);

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.07,
          ),
          AppPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.normal(
                  text: "My",
                  color: kTextSecondColor.withOpacity(0.7),
                ),
                const AppText.title(
                  text: "Favorites",
                  color: kPrimaryColor,
                  size: 35,
                ),
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.77,
            child: MasonryGridView.builder(
              scrollDirection: Axis.vertical,
              itemCount: providerFavorite.myFavoriteProductsList.length,
              gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                Product favoriteProvider = providerFavorite.myFavoriteProductsList[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(products: favoriteProvider),
                      ),
                    );
                  },

                  //   onTap: (() => providerFavorite.toggle(
                  //         favoriteProvider,
                  //       )),
                  child: Image.asset(favoriteProvider.image!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

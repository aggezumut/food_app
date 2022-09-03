import 'package:flutter/material.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:provider/provider.dart';

import '../../components/customs.dart';
import '../../product/pizza_products.dart';
import '../../state/my_favorite_products_provider.dart';
import '../../state/shopping_cart_provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.products}) : super(key: key);
  final Product products;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  
  Text _buildRatingStars(int rating) {
    String stars = '';
    for (int i = 0; i < rating; i++) {
      stars += '⭐ ';
    }
    return Text(stars);
  }

  @override
  Widget build(BuildContext context) {
    AppShoppingCartState providerShopping = Provider.of<AppShoppingCartState>(context);
    AppFavoriteProducts providerFavorite = Provider.of<AppFavoriteProducts>(context);

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Container(
              height: size.height * 0.45,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.products.image.toString()),
                ),
              ),
            ),
            const Positioned(
                left: 20,
                top: 40,
                child: Icon(
                  Icons.menu_rounded,
                  color: kBackgroundColor,
                  size: 30,
                )),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 12, right: 12, top: 30, bottom: 10),
                height: size.height * 0.56,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText.title(
                          text: widget.products.name.toString(),
                        ),
                        AppText.title(text: "\$${widget.products.price}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.location_on_sharp,
                            color: kPrimaryColor,
                          ),
                          AppText.subtitle(text: widget.products.location.toString()),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        _buildRatingStars(widget.products.rating),
                        AppText.subtitle(text: "(${widget.products.rating.toString()}.0)")
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    AppText.normal(
                      text: "Piece",
                      color: kTextSecondColor.withOpacity(0.8),
                    ),
                    const AppText.subtitle(text: "How much of the product do you want to order?"),
                    const SizedBox(
                      height: 20,
                    ),
                     const Customs(),
                     
                    const SizedBox(
                      height: 20,
                    ),
                    const AppText.title(text: "Description"),
                    AppText.subtitle(
                      text: widget.products.description.toString(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: kPrimaryColor),
                            // color: Colors.white,
                          ),
                          height: 60,
                          width: 60,
                          child: IconButton(
                              onPressed: () {
                                providerFavorite.toggle(widget.products);
                              },
                              icon: Icon(
                                providerFavorite.isInFavourites(widget.products.name!)
                                    ? Icons.favorite
                                    : Icons.favorite_outline_outlined,
                                color: kPrimaryColor,
                                size: 35,
                              )),
                        ),
                        SizedBox(
                          height: 60,
                          width: size.width * 0.75,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: providerShopping.addingProductsList.contains(widget.products)
                                    ? Colors.pink.withOpacity(0.6)
                                    : Colors.pink),
                            onPressed: () {
                              if (providerShopping.addingProductsList.contains(widget.products)) {
                                print("There are products");
                              } else {
                                providerShopping.addProducts(widget.products);
                              }
                            },
                            child: const Text("Add to Basket"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

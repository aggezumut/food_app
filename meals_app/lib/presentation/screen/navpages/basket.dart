import 'package:flutter/material.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/state/shopping_cart_provider.dart';
import 'package:meals_app/widgets/app_button.dart';
import 'package:meals_app/widgets/app_text.dart';
import 'package:provider/provider.dart';
import '../../../widgets/app_padding.dart';

class BasketPage extends StatelessWidget {
  const BasketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AppShoppingCartState shoppingCartProvider = Provider.of<AppShoppingCartState>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: AppPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              height: size.height * 0.07,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppText.normal(
                  text: "Order",
                  color: kTextSecondColor.withOpacity(0.7),
                ),
                const AppText.title(
                  text: "Summary",
                  color: kPrimaryColor,
                  size: 35,
                ),
                SizedBox(
                  height: size.height * 0.65,
                  child: ListView.builder(
                    itemCount: shoppingCartProvider.addingProductsList.length,
                    itemBuilder: (context, index) {
                      final product = shoppingCartProvider.addingProductsList[index];
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        decoration: BoxDecoration(
                          border: Border.all(color: kPrimaryColor, width: 2),
                          color: kBackgroundColor,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 8,
                              offset: const Offset(8, 4), // changes position of shadow
                            ),
                          ],
                        ),
                        height: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(product.image!),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(13),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText.normal(text: product.name!),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.location_on,
                                      color: kSecondColor,
                                    ),
                                    AppText.subtitle(text: product.location!),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                AppText.normal(
                                  text: "\$${product.price}",
                                  size: 20,
                                  color: kTextSecondColor.withOpacity(0.8),
                                )
                              ],
                            ),
                            SizedBox(
                              width: 60,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RawMaterialButton(
                                    fillColor: kPrimaryColor,
                                    padding: const EdgeInsets.all(5),
                                    shape: const CircleBorder(),
                                    //elevation: 10,
                                    onPressed: () {
                                      shoppingCartProvider.increaseProductPiece(product);
                                    },
                                    child: const Icon(
                                      Icons.add,
                                      color: kBackgroundColor,
                                    ),
                                  ),
                                  AppText.normal(
                                    text: product.piece.toString(),
                                    size: 23,
                                    fontWeight: FontWeight.normal,
                                  ),
                                  RawMaterialButton(
                                    fillColor: kPrimaryColor,
                                    padding: const EdgeInsets.all(5),
                                    shape: const CircleBorder(),
                                    onPressed: () {
                                      shoppingCartProvider.decreaseProductPiece(product);
                                      if (product.piece == 0) {
                                        shoppingCartProvider.removeProducts(product);
                                      }
                                    },
                                    child: const Icon(
                                      Icons.remove,
                                      color: kBackgroundColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText.title(
                      text: "Total",
                      color: kTextSecondColor.withOpacity(0.8),
                    ),
                    AppText.title(
                      text: "\$${shoppingCartProvider.totalPrice.toString()}",
                      size: 35,
                    ),
                  ],
                ),
                AppButton.basket(
                  width: size.width,
                  press: () {},
                  child: const AppText.subtitle(
                    text: "Proceed Next",
                    color: kBackgroundColor,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

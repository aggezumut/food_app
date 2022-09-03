import 'package:flutter/material.dart';
import 'package:meals_app/components/app_theme_color.dart';
import 'package:meals_app/presentation/screen/navpages/main_page.dart';
import 'package:meals_app/product/page_view_products.dart';
import 'package:meals_app/widgets/app_button.dart';
import 'package:meals_app/widgets/app_text.dart';

class PageViewPage extends StatelessWidget {
  const PageViewPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: pageViewDetail.length,
          itemBuilder: (context, index) {
            PageViewProduct pageView = pageViewDetail[index];
            return SizedBox(
              width: size.width,
              height: size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 30,
                      top: 15,
                    ),
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * 0.7,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const AppText.title(text: "Food"),
                              const AppText.title(
                                text: "Exploration",
                                color: kSecondColor,
                                size: 30,
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              AppText.subtitle(
                                text: pageView.description,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: size.width * 0.03,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(
                              3,
                              (indexSlider) {
                                return Container(
                                  margin: const EdgeInsets.all(3),
                                  height: indexSlider == index ? 20 : 8, // kaydırıcı geçişindeki büyülme küçülme..
                                  decoration: BoxDecoration(
                                    color: indexSlider == index
                                        ? Colors.pink
                                        : Colors.grey, // kaydırıcıdaki aktif pasif renk
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, bottom: 5),
                    child: AppButton.pageView(
                      width: size.width * 0.3,
                      child: const Icon(Icons.navigate_next),
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    height: size.height * 0.7,
                    width: size.width,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(pageView.image),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

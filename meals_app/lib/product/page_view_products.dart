class PageViewProduct {
  late final String image;
  late final String description;

  PageViewProduct(this.description, this.image);
}

List<PageViewProduct> pageViewDetail = [
  PageViewProduct("I think cooking is an art, and great artists never stop learning - a cook is no different. ", "assets/images/pageview_0.jpg"),
  PageViewProduct("A recipe has no soul. You, as the cook, must bring soul to the recipe.", "assets/images/pageview_1.jpg"),
  PageViewProduct("I know once people get connected to real food, they never change back.", "assets/images/pageview_2.jpg"),
];

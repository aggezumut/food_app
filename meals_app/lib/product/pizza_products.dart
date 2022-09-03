class Product {
  
  String? image, name,location,description;
  double price;
  int rating;
  String? type;
  int productType;
  int piece;


  Product(this.piece,this.image, this.name, this.price,this.location,this.description,this.rating,this.type,this.productType);
} 

List<Product> products = [
  Product(0,"assets/images/pizza_1.jpg", "Neapolitan",23,"İstanbul, Üsküdar","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.First",3,"pizza",1),
  Product(0,"assets/images/pizza_2.jpg", "Chicago",13,"İstanbul, Kadıköy","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.Second ",2,"pizza",1),
  Product(0,"assets/images/pizza_3.jpg", "Sicilian",39,"İstanbul, Ataşehir","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.Third",5,"pizza",1),
  Product(0,"assets/images/pizza_5.jpg","Greek",25,"İstanbul, Ümraniye","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines. ",4,"pizza",1),
  Product(0,"assets/images/burger_1.jpg", "Regular",10,"İstanbul, Üsküdar","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.First ",1,"burger",2),
  Product(0,"assets/images/burger_2.jpg", "Cheese",18,"İstanbul, Üsküdar","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.First ",2,"burger",2),
  Product(0,"assets/images/burger_3.jpg", "Zinger",12,"İstanbul, Üsküdar","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.First ",5,"burger",2),
  Product(0,"assets/images/burger_4.jpg","XXX",22,"İstanbul, Üsküdar","A Cook is a restaurant worker who is responsible for preparing food items and menu items in accordance with company standards and guidelines.First ",3,"burger",2),
];

  


class ProductService {


  Future<List<Product>> getProducts() async{
    // endpoint' istek atılacak
    return products;
  }

  Future<List<Product>> getPizzas() async{
    // endpoint' istek atılacak
   final List<Product> productList = await getProducts();
    return productList.where((element) => element.productType == 1).toList();
  }

  Future<List<Product>> getBurgers() async{
    // endpoint' istek atılacak
   final List<Product> productList = await getProducts();
    return productList.where((element) => element.productType == 2).toList();
  }

}
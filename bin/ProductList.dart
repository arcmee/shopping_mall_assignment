import 'Product.dart';

class ProductList{
  List<Product> products = [];

  ProductList();

  void addProduct(String name, int price){
    products.add(Product(name, price));
  }

  void removeProduct(String name){
    products.remove(name);
  }

  // void printProductList(){
  //   int i = 1;
  //   products.forEach((_, value) => 
  //     print('[${i++}] ${value.name} / ${value.price}')
  //   );
  // }

  void printProductList(){
    for(int i = 0; i < products.length; i++){
      print('[${i+1}] ${products[i].name} / ${products[i].price}');
    }
  }

  Product? getProductByIndex(int index) {
    if(products.isEmpty){
      return null;
    }
    if(!(index-1 > products.length && index-1 < 0)) {
      return products[index -1];
    }
    else{
      return null;
    }
    
  }
}
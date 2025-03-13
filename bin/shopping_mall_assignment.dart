import 'package:shopping_mall_assignment/shopping_mall_assignment.dart' as shopping_mall_assignment;
import 'Product.dart';
import 'Cart.dart';
void main(List<String> arguments) {
  List<Product> productList = [];
  productList.add(Product('셔츠', 45000));
  productList.add(Product('원피스', 30000));
  productList.add(Product('반팔티', 35000));
  productList.add(Product('반바지', 38000));
  productList.add(Product('양말', 5000));

  for(Product product in productList){
    print('${product.name} / ${product.price}');
  }
  Cart cart = Cart();
  cart.insertProduct(Product('셔츠', 45000));
  cart.insertProduct(Product('셔츠', 45000));
  cart.insertProduct(Product('셔츠', 45000));
  cart.insertProduct(Product('원피스', 30000));

  cart.printInsertedProducts();

}



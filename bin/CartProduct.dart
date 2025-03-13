import 'Product.dart';

class CartProduct {
  Product product;
  int amount = 1;

  CartProduct(this.product);

  int increaseAmount(){
    return ++amount;
  }

  String getProductName(){
    return product.name;
  }
  int getProductPrice(){
    return product.price;
  }
  int getTotalPrice(){
    return product.price * amount;
  }

}
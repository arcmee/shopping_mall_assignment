import 'Product.dart';

class CartProduct {
  Product product;
  int amount = 1;

  CartProduct(this.product);
  CartProduct.withAmount(this.product, this.amount);

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

  void setAmount(int amount){
    this.amount = amount;
  }

}
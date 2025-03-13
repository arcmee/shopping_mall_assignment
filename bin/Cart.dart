import 'CartProduct.dart';
import 'Product.dart';

class Cart {
  Map<String?, CartProduct> insertedProduct = {};

  void insertProduct(Product product){
    if(insertedProduct.containsKey(product.name)) {
      insertedProduct.update(
        product.name, (cartProduct) {
          cartProduct.increaseAmount();
          return cartProduct;
        });
    }
    else{
      insertedProduct.addAll({product.name : CartProduct(product)});
    }
  }

  int calculateProductsPrice(){
    if(insertedProduct.isEmpty){
      return 0;
    }
    else{
      int totalPrice = 0;
      insertedProduct.forEach((_,value) {
        totalPrice += value.amount * value.getProductPrice();
      });

      return totalPrice;
    }
  }

  void printInsertedProducts(){
    insertedProduct.forEach((name, product) => 
      print('$name${(product.getProductPrice())}/ ${product.amount} / ${product.getTotalPrice()}'
    ));
  }

  Cart();
}




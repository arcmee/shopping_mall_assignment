import 'Product.dart';

class Cart {
  Map<Product, int> insertedProduct = {};
  void insertProduct(Product product){
    if(insertedProduct.containsKey(product)) {
      insertedProduct.update(product, (amount) => amount += 1);
    }
    else{
      insertedProduct.addAll({product:1});
    }
  }

  int calculateProductsPrice(){
    // return insertedProduct
    return 0;
  }

  void printInsertedProducts(){
    insertedProduct.forEach((product, amount) => 
      print({'${product.name}${(product.price)} / ${amount*product.price}'}
    ));
  }

  Cart();
}




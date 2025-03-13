import 'Product.dart';
import 'ProductList.dart';
import 'Cart.dart';
import 'dart:io';
import 'MallActions.dart';

class ShoppingMall{
  late ProductList productList;
  late Cart cart;

  ShoppingMall(){
    productList = ProductList();
    cart = Cart();
    initiallizeProductList();

    // printIntroduce();
  }

  void initiallizeProductList(){
    productList.addProduct('shirts', 45000);
    productList.addProduct('onePiece', 30000);
    productList.addProduct('short-sleeve', 35000);
    productList.addProduct('shorts', 38000);
    productList.addProduct('socks', 5000);
  }

  void printAllProducts(){
    productList.printProductList();
  }

  void printIntroduce(){
    String menus = '';
    print('------------------------------------------------------------------------------------------------');
    // print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    for( var value in MallActions.values){
      if(value.index == 0) continue;
      menus += '[${value.index}] ${value.name}';
    }
    print(menus);
    print('------------------------------------------------------------------------------------------------');
  }

  void run(){
    String command = '';
    bool exit = false;
    
    while(!exit) {
      printIntroduce();
      command = stdin.readLineSync()!;

      if( MallActions.exit.index.toString() == command ){
        print("정말 끝내시겠습니까? Y/N");
        exit = exitConfirm();
      }
      else if( MallActions.intoCartByIndex.index.toString() == command ) {
        printAllProducts();
        print('담을 물건의 번호를 입력해 주세요');
        command = stdin.readLineSync()!;
        var productToCart = productList.getProductByIndex(int.parse(command));
        if(productToCart != null){
          cart.insertProduct(productToCart);
        }
        cart.printInsertedProducts();
      }
      else if( MallActions.intoCartByName.index.toString() == command){
        printAllProducts();
        print('담을 물건의 이름을 입력해 주세요');
        command = stdin.readLineSync()!;
        var productToCart = productList.getProductByName(command);
        if(productToCart == null){
          print('해당 상품이 없습니다.');
          continue;
        }
        print('갯수를 입력해 주세요');
        int amount = 0;
        do{
          try{
            command = stdin.readLineSync()!;
            amount = int.parse(command);
          }
          catch(e){
            print(e);
            print('다시 입력해 주세요');
          }
        }while(amount < 1);
        cart.insertProductAndAmount(productToCart, int.parse(command));
        cart.printInsertedProducts();
      }
      else if( MallActions.showList.index.toString() == command ) {
        printAllProducts();
      }
      else if( MallActions.totalPriceInCart.index.toString() == command ) {
        if(cart.insertedProduct.isEmpty){
          print('카트가 비어있습니다.');
          continue;
        }
        cart.printInsertedProducts();
        print('총 ${cart.calculateProductsPrice()}');
      }
      else if( MallActions.clearCart.index.toString() == command ) {
        cart.clearCart();
        if(cart.insertedProduct.isEmpty){
          print('카트가 비어있습니다.');
          continue;
        }
      }
      else {
        print("다시 입력해 주세요");
      }
    }
  }

  bool exitConfirm(){
    String command = stdin.readLineSync()!;
    if(command.toLowerCase() == 'y'){
      print('이용해 주셔서 감사합니다 ~ 안녕히 가세요!');
      return true;
    }
    else{
      return false;
    }
  }

  
}
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
    productList.addProduct('셔츠', 45000);
    productList.addProduct('원피스', 30000);
    productList.addProduct('반팔티', 35000);
    productList.addProduct('반바지', 38000);
    productList.addProduct('양말', 5000);
  }

  void printAllProducts(){
    productList.printProductList();
  }

  void printIntroduce(){
    print('------------------------------------------------------------------------------------------------');
    print('[1] 상품 목록 보기 / [2] 장바구니에 담기 / [3] 장바구니에 담긴 상품의 총 가격 보기 / [4] 프로그램 종료');
    print('------------------------------------------------------------------------------------------------');
  }

  void run(){
    String command = '';
    bool exit = false;
    print(command);

    while(!exit) {
      printIntroduce();
      command = stdin.readLineSync()!;

      if( MallActions.exit.index.toString() == command ){
        print("정말 끝내시겠습니까? Y/N");
        exit = exitConfirm();
      }
      else if( MallActions.intoCart.index.toString() == command ) {
        printAllProducts();
        print('담을 물건의 번호를 입력해 주세요');
        command = stdin.readLineSync()!;
        var productToCart = productList.getProductByIndex(int.parse(command));
        if(productToCart != null){
          cart.insertProduct(productToCart);
        }
        cart.printInsertedProducts();
      }
      else if( MallActions.showList.index.toString() == command ) {
        printAllProducts();
      }
      else if( MallActions.totalPriceInCart.index.toString() == command ) {
        cart.printInsertedProducts();
        print(cart.calculateProductsPrice());
      }
      else {
        print("다시 입력해 주세요");
      }
    }
  }

  bool exitConfirm(){
    String command = stdin.readLineSync()!;
    if(command.toLowerCase() == 'y'){
      return true;
    }
    else{
      return false;
    }
  }

  void insertToCart(){

  }
  
}
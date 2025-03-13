enum MallActions {
  any,
  showList,
  intoCartByIndex,
  intoCartByName,
  totalPriceInCart,
  exit,
  clearCart,
}

extension MallActionsExtension on MallActions {

  String get name {
    switch (this) {
      case MallActions.showList:
        return '상품 목록 보기';
      case MallActions.intoCartByIndex:
        return '장바구니에 담기(번호)';
      case MallActions.intoCartByName:
        return '장바구니에 담기(이름 갯수)';
      case MallActions.totalPriceInCart:
        return '장바구니에 담긴 상품의 총 가격 보기';
      case MallActions.exit:
        return '프로그램 종료';
      case MallActions.clearCart:
        return '장바구니 비우기';                      
      default:
        return "";
    }
  }
}
import '../../../common/bases/base_event.dart';

class FetchCartEvent extends BaseEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}



class AddCartEvent extends BaseEvent{
  String idProduct;
  AddCartEvent(this.idProduct);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class ChangeQtyCartItemEvent extends BaseEvent{
  String idProduct;
  String idCart;
  int quantity;
  ChangeQtyCartItemEvent(this.idProduct, this.idCart , this.quantity);
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ConfirmCartEvent extends BaseEvent{
  @override
  // TODO: implement props
  List<Object?> get props => [];

  ConfirmCartEvent();
}
class ConfirmCartSuccessEvent extends BaseEvent{
  String msg;

  ConfirmCartSuccessEvent(this.msg);

  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class ConfirmCartFailedEvent extends BaseEvent{
  String message;

  ConfirmCartFailedEvent({required this.message});
  @override
  List<Object?> get props => [];

}


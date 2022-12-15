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
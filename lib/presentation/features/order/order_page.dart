import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../common/widgets /progress_listener_widget.dart';
import '../../../common/bases/base_widget.dart';
import '../../../common/constants/api_constant.dart';
import '../../../common/utils/extension.dart';
import '../../../data/datasources/remote/api_request.dart';
import '../../../common/widgets /loading_widget.dart';
import '../../../data/model/cart.dart';
import '../../../data/repositories/order_repository.dart';
import 'order_bloc.dart';
import 'order_event.dart';
class OrderPage extends StatefulWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

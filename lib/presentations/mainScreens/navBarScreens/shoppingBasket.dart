
import 'package:flutter/material.dart';

import '../../emptyStateScreens/noOrderHistory.dart';

class BasketCardScreen extends StatelessWidget {
  const BasketCardScreen({Key? key}) : super(key: key);
  static const route = "/basketCardScreen";
 final bool isOrder = false;
  @override
  Widget build(BuildContext context) {
    return  isOrder? Column():NoOrderState();
  }
}

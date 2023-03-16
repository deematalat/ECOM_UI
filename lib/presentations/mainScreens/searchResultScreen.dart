

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../emptyStateScreens/NoSearchItem.dart';

class SearchItemScreen extends StatelessWidget {
  const SearchItemScreen({Key? key}) : super(key: key);
  static const route='/SearchScreen';
 final bool isFound=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     body: isFound ?Column():NoAvilableItem(),
    );
  }
}



import 'package:flutter/material.dart';

import '../../emptyStateScreens/noFavYet.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({Key? key}) : super(key: key);
  final bool  isFav =false;
  @override
  Widget build(BuildContext context) {
    return isFav?Column():EmptyFavorite();
  }
}

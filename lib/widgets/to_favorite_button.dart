import 'package:flutter/material.dart';
import 'package:wallcraft/models/items.dart';
import 'package:wallcraft/resources/images.dart';

class ToFavoriteButton extends StatefulWidget {
  const ToFavoriteButton(
      {Key? key, required this.index, required this.itemList})
      : super(key: key);
  final int index;
  final List<Items> itemList;

  @override
  _ToFavoriteButtonState createState() => _ToFavoriteButtonState();
}

class _ToFavoriteButtonState extends State<ToFavoriteButton> {
  get itemList => widget.itemList;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      heroTag: null,
      onPressed: () {
        setState(() {
          itemList[widget.index].favorite = !itemList[widget.index].favorite;
        });
      },
      child: itemList[widget.index].favorite
          ? const Icon(Icons.star)
          : const Icon(Icons.star_outline_outlined),
    );
  }
}

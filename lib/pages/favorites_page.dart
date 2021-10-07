import 'package:flutter/material.dart';
import 'package:wallcraft/models/items.dart';
import 'package:wallcraft/resources/images.dart';
import 'package:wallcraft/resources/strings.dart';
import 'package:wallcraft/widgets/to_favorite_button.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  List<Items> _favoriteDataItems = [];

  @override
  Widget build(BuildContext context) {
    for (int index = 0; index < itemsData.length; index++) {
      if (itemsData[index].favorite) {
        _favoriteDataItems.add(itemsData[index]);
      }
    }
    _favoriteDataItems = _favoriteDataItems.toSet().toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(ProjectStrings.favoriteAppBarTitle,
            style: Theme.of(context).textTheme.headline1),
      ),
      body: _favoriteDataItems.isNotEmpty
          ? RefreshIndicator(
              onRefresh: _pullRefresh,
              child: GridView.builder(
                  padding: const EdgeInsets.all(5),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: _favoriteDataItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(children: [
                      Image.network(
                        _favoriteDataItems[index].url,
                        fit: BoxFit.cover,
                      ),
                      Positioned(
                        bottom: 3,
                        right: 3,
                        child: ToFavoriteButton(
                          index: index,
                          itemList: _favoriteDataItems,
                        ),
                      )
                    ]);
                  }),
            )
          : Container(),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {
      for (int index = 0; index < _favoriteDataItems.length; index++) {
        if (_favoriteDataItems[index].favorite == false) {
          _favoriteDataItems.removeAt(index);
        }
      }
    });
  }
}

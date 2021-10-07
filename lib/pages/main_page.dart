import 'package:flutter/material.dart';
import 'package:wallcraft/resources/images.dart';
import 'package:wallcraft/widgets/main_page_appbar.dart';
import 'package:wallcraft/widgets/to_favorite_button.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: MainPageAppBar(screenHeight * 0.075),
      body: RefreshIndicator(
        onRefresh: _pullRefresh,
        child: GridView.builder(
          padding: const EdgeInsets.all(5),
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
            childAspectRatio: 2 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: itemsData.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: [
              Image.network(
                itemsData[index].url,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 3,
                right: 3,
                child: ToFavoriteButton(index: index, itemList: itemsData,),
              )
            ]);
          },
        ),
      ),
    );
  }

  Future<void> _pullRefresh() async {
    setState(() {});
  }
}

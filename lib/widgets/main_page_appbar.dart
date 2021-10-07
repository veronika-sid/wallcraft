import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wallcraft/resources/strings.dart';

class MainPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainPageAppBar(this.screenHeight, {Key? key}) : super(key: key);
  final double screenHeight;

  @override
  Size get preferredSize => Size.fromHeight(screenHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        ProjectStrings.appName,
        style: Theme.of(context).textTheme.headline1,
      ),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, ProjectStrings.favoritePageRoute);
          },
          icon: const Icon(Icons.star_border),
          iconSize: 30,
        )
      ],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
  }
}

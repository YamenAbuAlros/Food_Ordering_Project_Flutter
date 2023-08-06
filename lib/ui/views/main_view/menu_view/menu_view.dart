import 'package:flutter/material.dart';
import 'package:foodordering/core/translation/app_translation.dart';
import 'package:foodordering/ui/shared/utils.dart';

class MenuView extends StatefulWidget {
  const MenuView({super.key});

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
    

    return Center(
      child: Text(
        tr("Menu View"),
        style: TextStyle(fontSize: width * 0.07),
      ),
    );
  }
}

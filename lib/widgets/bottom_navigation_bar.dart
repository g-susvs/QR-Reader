import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_reader/provider/ui_provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);

    int currentIndex = uiProvider.curretIndex;

    return BottomNavigationBar(
      onTap: (value){
        print("$value");
        uiProvider.setIndex = value;
      },
      currentIndex: currentIndex,
        items:const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: "Geo"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dataset_linked_outlined),
            label: "Http"
          ),
        ] 
      );
  }
}
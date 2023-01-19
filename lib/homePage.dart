import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/card.dart';
import 'components/products.dart';
import 'components/search.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentCupertinoIndex = 0;

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(

        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            IndexedStack(
              index: currentCupertinoIndex,
              children: [
                Product(),
                Search(),
                Cart(),
              ],
            ),
            CupertinoTabBar(
              height: 60,
              border: Border(
                  top: BorderSide(
                    color: Colors.grey,
                    width: 1.5,
                  )),
              currentIndex: currentCupertinoIndex,
              onTap: (val) {
                setState(() {
                  currentCupertinoIndex = val;
                });
              },
              items: [
                BottomNavigationBarItem(
                  label: "Products",
                  icon: Icon(CupertinoIcons.home),
                ),
                BottomNavigationBarItem(
                  label: "Search",
                  icon: Icon(CupertinoIcons.search),
                ),
                BottomNavigationBarItem(
                  label: "Cart",
                  icon: Icon(CupertinoIcons.shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

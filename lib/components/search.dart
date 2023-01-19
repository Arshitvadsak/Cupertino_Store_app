import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals/globals.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: 45,
          ),
          Container(
            height: 50,
            width: 320,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.black12,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CupertinoTextField(
                prefix: Icon(CupertinoIcons.search,color: Colors.grey),
                suffix: Icon(CupertinoIcons.clear_circled,color: Colors.grey,),
                placeholder: '  Search any products',
                placeholderStyle: TextStyle(color: Colors.grey),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),

                ),
              ),
            ),
          ),
          Column(
            children: Products.map(
              (e) => Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width * 0.23,
                        child: Image(
                          image: AssetImage(
                            e['image'],
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${e['name']}',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Text(
                              e['price'],
                              style: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sum = sum +
                                int.parse(
                                  e['price'],
                                );
                            CartProducts.add(e);
                          });
                          log('$CartProducts');
                        },
                        child: Icon(
                          CupertinoIcons.add_circled,
                          size: 25,
                        ),
                      ),
                      SizedBox(width: 15),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    indent: 100,
                  ),
                ],
              ),
            ).toList(),
          ),
        ],
      ),
    );
  }
}

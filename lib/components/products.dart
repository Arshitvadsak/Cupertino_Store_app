import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../globals/globals.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  State<Product> createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 80,
                ),
                const Text(
                  ' Cupertino Store',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1,
                ),
              ],
            ),
          ),
          Expanded(
            flex: 10,
            child: Container(
              height: height * 0.8,
              width: width * 1,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    ...Products.map(
                          (e) => Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: height * 0.11,
                                width: width * 0.23,
                                child: Image(
                                  image: AssetImage(
                                    e['image'],
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              Container(
                                height: height * 0.1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${e['name']}',
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      children: [
                                        const Text('\$',style: TextStyle(color: Colors.grey),),
                                        Text(
                                          '${e['price']}',
                                          style: const TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    sum =sum + int.parse(e['price'],);
                                    CartProducts.add(e);
                                  });
                                  log('$CartProducts');
                                },
                                child: Icon(CupertinoIcons.add_circled,size: 25,),
                              ),
                            ],
                          ),
                          const SizedBox(
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
                    const SizedBox(height: 20,)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

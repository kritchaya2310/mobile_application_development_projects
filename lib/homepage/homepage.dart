import 'package:flutter/material.dart';

import '../add_items/add_items_page.dart';
import '../app_screens/button.dart';
import 'inputfield_search.dart';
import 'items.dart';
import 'items_search.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          backgroundColor: Colors.redAccent,
          width: 200,
          child: Column(
            children: [
              SizedBox(
                height: 70,
              ),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 3),
                    borderRadius: BorderRadius.all(Radius.circular(60))),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          tooltip: "Add item",
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddItems(),
                ));
          },
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
          child: const Icon(Icons.add),
        ),
        body: Container(
            width: double.infinity,
            decoration: BoxDecoration(color: Colors.white),
            child: Column(children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                        color: Colors.redAccent,
                        border: Border.all(color: Colors.black, width: 3),
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  InputFieldSearch(),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.blue[400],
                      border: Border.all(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          ItemsSearch(),
                          ItemsSearch(),
                          ItemsSearch(),
                        ],
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Expanded(
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(60),
                                  )),
                              child: ListView(
                                children: [
                                  Column(
                                    children: [
                                      Text("Recommend"),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Items(),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Items()
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Items(),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Items()
                                        ],
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                    ],
                                  ),
                                ],
                              )))
                    ],
                  ),
                ),
              ),
            ])));
  }
}

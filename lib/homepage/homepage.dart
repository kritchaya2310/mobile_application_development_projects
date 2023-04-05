import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobile_application_development_projects/homepage/items_search.dart';
import '../add_items/add_items_page.dart';
import 'drawer.dart';
import 'inputfield_search.dart';
import 'items.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _searchQuery = '';

  void _onSearchQueryChanged(String query) {
    setState(() {
      _searchQuery = query;
    });
  }

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
            DrawerBookmark(),
            SizedBox(
              height: 70,
            ),
            DrawerSetting()
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
        decoration: BoxDecoration(color: Colors.blue),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Builder(
                  builder: (context) => GestureDetector(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.redAccent,
                          border: Border.all(color: Colors.black, width: 3),
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      child: Icon(Icons.menu),
                    ),
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                InputFieldSearch(onChanged: _onSearchQueryChanged),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: _buildSearchResults(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    if (_searchQuery.isEmpty) {
      return ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) => Column(
          children: [
            Text("Recommend"),
            SizedBox(
              height: 20,
            ),
            Items(),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      );
    } else {
      return ItemSearch(
        query: _searchQuery,
      );
    }
  }
}

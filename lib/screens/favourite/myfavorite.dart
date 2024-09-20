import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_state_management/provider/favorite_provider.dart';

class MyFavoriteItemScreen extends StatefulWidget {
  const MyFavoriteItemScreen({super.key});

  @override
  State<MyFavoriteItemScreen> createState() => _MyFavoriteItemScreenState();
}

class _MyFavoriteItemScreenState extends State<MyFavoriteItemScreen> {
  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<FavoriteItemProvider>(context);

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: const Text(
          'Favourite List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
                  itemCount: favoriteProvider.selectedItem.length,
                  itemBuilder: (context, index) {
                    return Consumer<FavoriteItemProvider>(
                        builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.selectedItem.contains(index)) {
                            value.removeItem(index);
                          } else {
                            value.addItem(index);
                          }
                        },
                        title: Text('Item ' + index.toString()),
                        trailing: Icon(value.selectedItem.contains(index)
                            ? Icons.favorite
                            : Icons.favorite_border_outlined),
                      );
                      ;
                    });
                  }))
        ],
      ),
    );
  }
}

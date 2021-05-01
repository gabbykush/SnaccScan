import 'package:csci380project/resources/store.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class StoreContainer extends StatelessWidget {
  final Store store;

  StoreContainer({Key key, @required this.store}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(5),
      height: null,
      decoration: new BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  store.name,
                  style: TextStyle(fontSize: 20),
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.shopping_cart,
                          size: 18,
                        ),
                        Text(
                          store.basePrice,
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, size: 18),
                        Text(
                          store.rating ?? 'No Rating',
                          style: TextStyle(fontSize: 15),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          Expanded(
            child: ElevatedButton(
                onPressed: () async {
                  launch(store.link);
                },
                child: Text('Visit Site')),
          )
        ],
      ),
    );
  }
}

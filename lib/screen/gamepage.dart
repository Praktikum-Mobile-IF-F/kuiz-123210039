import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_123210039_kuiz/game_store.dart';
import 'package:flutter_123210039_kuiz/screen/detailpage.dart';

class GamesPage extends StatelessWidget {
  const GamesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Data Game",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            crossAxisSpacing: 2,
            mainAxisSpacing: 1,
            mainAxisExtent: 250),
        itemCount: gameList.length,
        padding: EdgeInsets.all(8.0),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailPage(gameStore: gameList[index]);
              }));
            },
            child: Card(
              child: Row(
                children: [
                  Image.network(
                    gameList[index].name,
                    width: 200,
                    height: double.infinity,
                    // fit: BoxFit.cover,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            gameList[index].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.lightBlue,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Title : ${gameList[index].name}",
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                color: Colors.grey),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.book,
                                color: Colors.grey,
                              ),
                              Text(
                                "${gameList[index].price.toString()} Rupiah",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

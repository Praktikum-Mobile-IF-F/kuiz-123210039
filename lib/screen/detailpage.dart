import 'package:flutter/material.dart';
import 'package:flutter_123210039_kuiz/game_store.dart';

class DetailPage extends StatelessWidget {
  GameStore gameStore;

  DetailPage({super.key, required this.gameStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(gameStore.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: [
          Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image.network(
              gameStore.about,
              width: 150,
            )
          ]),
          SizedBox(
            height: 20,
          ),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text("Title   : ${gameStore.name}"),
            Text("Tanggal Rilis     : ${gameStore.releaseDate}"),
            Text("Tags     : ${gameStore.tags}"),
            Text("Harga    : ${gameStore.price.toString()}"),
            Text("Tentang   : ${gameStore.about}"),
            Text("Gambar   : ${gameStore.imageUrls}"),
            Text("Rata-rata penilaian   : ${gameStore.reviewAverage}"),
            Text("Rata-rata Jumlah  : ${gameStore.reviewCount}"),
            Text("Link Store  : ${gameStore.linkStore}"),
          ]),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

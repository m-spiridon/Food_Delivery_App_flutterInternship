import 'package:flutter/material.dart';

class ProducersOptions extends StatelessWidget {
  final foodType;
  final image;
  final producersOptions;

  const ProducersOptions(
      {Key key, this.foodType, this.producersOptions, this.image})
      : super(key: key);

  _buildProducersList() {
    return producersOptions
        .map<Widget>((it) => ListTile(
              title: Text(it['name']),
              onTap: () {
                print("$foodType tapped");
              },
            ))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodType),
        flexibleSpace: Image(
          image: NetworkImage(image),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Container(
        child: ListView(
          children: _buildProducersList(),
        ),
      ),
    );
  }
}

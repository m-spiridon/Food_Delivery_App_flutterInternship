import 'package:flutter/material.dart';
import 'package:internship_project_1/components/producer_card.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/producer_data.dart';
import 'package:internship_project_1/shared/px2dpx.dart';

class ProducersScreen extends StatefulWidget {
  static const String id = 'producers_screen';

  @override
  _ProducersScreenState createState() => _ProducersScreenState();
}

class _ProducersScreenState extends State<ProducersScreen> {
  List<Map<String, String>> filteredProducers = producers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: Text(S.of(context).ourProducersTitle),
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, convertPx2Dpx(context, 8)),
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: convertPx2Dpx(context, 3),
                vertical: convertPx2Dpx(context, 1)),
            child: TextField(
              cursorColor: Colors.white,
              decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Icon(Icons.search, color: Colors.white),
                hintText: S.of(context).searchBarHintText,
              ),
              onChanged: (value) {
                setState(() {
                  if (value.isNotEmpty) {
                    filteredProducers = [];

                    for (int i = 0; i < producers.length; i++) {
                      if (producers[i]['name']
                          .toLowerCase()
                          .contains(value.toLowerCase())) {
                        filteredProducers.add(producers[i]);
                      }
                    }
                  } else {
                    filteredProducers = producers;
                  }
                });
              },
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: ListView.builder(
            itemCount: filteredProducers.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: MediaQuery.of(context).size.height / 3,
                child: ProducerCard(
                  producerName: filteredProducers[index]['name'],
                  producerDescription: filteredProducers[index]['description'],
                  producerImage: filteredProducers[index]['image'],
                ),
              );
            }),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:internship_project_1/mocks/proposition_data.dart';
import 'package:internship_project_1/screens/discover_screen/proposition/proposition_list.dart';

class DiscoverProposition extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.all(10.0),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(propositionData['image']),
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                gradient: LinearGradient(
                  begin: FractionalOffset.center,
                  end: FractionalOffset.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0.0),
                    Colors.black.withOpacity(0.6),
                  ],
                  stops: [0.0, 0.4],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: ListTile(
                  title: Text(
                    '${propositionData['title']}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    '${propositionData['text']}',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PropositionList()));
      },
    );
  }
}

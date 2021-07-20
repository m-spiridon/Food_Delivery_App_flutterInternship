import 'package:flutter/material.dart';

class ProducerCard extends StatelessWidget {
  final String producerName;
  final String producerDescription;
  final String producerImage;

  ProducerCard(
      {@required this.producerName,
      @required this.producerDescription,
      @required this.producerImage});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          color: Colors.white,
        ),
        padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                    image: DecorationImage(
                        image: NetworkImage(producerImage),
                        fit: BoxFit.contain)),
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.only(left: 0.0),
              title: Text(
                producerName,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                producerDescription,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

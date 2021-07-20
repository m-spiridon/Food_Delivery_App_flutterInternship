import 'package:flutter/material.dart';

class RecipeCardMini extends StatelessWidget {
  final name;
  final desc;
  final image;

  RecipeCardMini(this.name, this.desc, this.image);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                  image: NetworkImage(image),
                  fit: BoxFit.cover,
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Text(
              name,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
          ),
          Text(
            desc.toString(),
            maxLines: 4,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

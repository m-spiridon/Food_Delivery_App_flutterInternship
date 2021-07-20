import 'package:flutter/material.dart';

class BlogCardBody extends StatelessWidget {
  const BlogCardBody({
    Key key,
    @required this.blogImage,
    @required this.blogTitle,
    @required this.blogText,
  }) : super(key: key);

  final String blogImage;
  final String blogTitle;
  final String blogText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      padding: EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
      width: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage('$blogImage'),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    blogTitle,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                  ),
                  Flexible(
                      child: Text(
                    '$blogText',
                    overflow: TextOverflow.fade,
                    style: TextStyle(color: Colors.grey),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

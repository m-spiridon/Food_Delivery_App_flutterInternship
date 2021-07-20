import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/discover_screen/blog_list/blog_card.dart';
import 'package:internship_project_1/screens/discover_screen/blog_list/blog_items.dart';

class BlogListView extends StatelessWidget {
  const BlogListView({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: blogs.length,
        itemBuilder: (BuildContext context, int index) {
          return BlogCard(
            blogTitle: blogs[index]['title'],
            blogText: blogs[index]['text'],
            blogImage: blogs[index]['image'],
            url: blogs[index]['url']
          );
        });
  }
}

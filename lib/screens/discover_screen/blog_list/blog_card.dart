import 'package:flutter/material.dart';
import 'package:internship_project_1/screens/discover_screen/blog_list/blog_card_body.dart';
import 'package:internship_project_1/screens/discover_screen/blog_list/modal_blog_window.dart';

class BlogCard extends StatelessWidget {
  final String blogTitle;
  final String blogText;
  final String blogImage;
  final String url;

  BlogCard(
      {@required this.blogTitle,
      @required this.blogText,
      @required this.blogImage,
      @required this.url});

  @override
  Widget build(BuildContext context) {
    return url != null
        ? InkWell(
            onTap: () {
              Navigator.of(context, rootNavigator: true).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return ModalBlogWindow(blogTitle: blogTitle, url: url);
                    },
                    fullscreenDialog: true,
                  ));
            },
            child: BlogCardBody(
                blogImage: blogImage, blogTitle: blogTitle, blogText: blogText),
          )
        : BlogCardBody(
            blogImage: blogImage, blogTitle: blogTitle, blogText: blogText);
  }
}



import 'dart:io';

import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class CreatePost extends StateWidget {
  @override
  void build() {
    print("\nWelcome to Post dashboard");
    print("Do you want Create Post?");
    print("1. Create");
    print("2. Exit");
    int command = io.number;
    if (command == 1) {
      stdout.write("\nChoose a title for your post: ");
      String title = io.text;
      stdout.write("Upload your content: ");
      String content = io.text;
      stdout.write("Enter MediaUrl: ");
      String mediaUrl = io.text;

      if (title.isEmpty || content.isEmpty || mediaUrl.isEmpty) {
        print("\nEmpty dates please try again!!!\n");
        build();
        return;
      }
      Post userPost = Post(title: title, content: content, mediaUrl: mediaUrl);
      print("\nYour content has been successfully uploaded!!!\n");
      User user = signInUsersList[0];
      user.writePost(userPost);
      print(user.getUserPosts);
      build();
      return;
    } else if (command == 2) {
      print("\nReturning to Home page\n");
      HomePage();
      return;
    } else {
      print("\nInvalid command!!!Please try again!!!");
      build();
    }
  }
}

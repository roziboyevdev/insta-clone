import 'dart:io';

import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class LikePage extends StateWidget {
  void build() {
    User user = signInUsersList[0];
    print(user.getUserPosts);
    print("1. Exit");
    stdout.write("Choose your post: ");
    String postCommand = io.text;
    if (postCommand == "1") {
      HomePage();
      return;
    }
    for (Post post in user.getUserPosts) {
      if (post.title == postCommand) {
        print("\nUsers who liked your $postCommand post: ");
        print(post.getLikes);
        print("");
        print("1. View who liked your post");
        print("2. Exit");
        stdout.write("Enter command: ");
        int likeCommand = io.number;
        if (likeCommand == 1) {
          build();
          return;
        } else if (likeCommand == 2) {
          HomePage();
          return;
        } else {
          print("Wrong command!!!\nPlease try again!!!\n");
          build();
          return;
        }
      }
    }
    print("Entered post doesn't exist!!!\nPlease try again!!!\n");
    build();
    return;
  }
}

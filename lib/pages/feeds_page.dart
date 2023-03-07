import 'dart:io';

import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/post.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class FeedPage extends StateWidget {
  void build() {
    print("1. View your and followers posts");
    print("2. Like for selected post");
    print("3. Delete post");
    print("4. Exit");
    stdout.write("Enter command: ");
    int command = io.number;
    if (command == 1) {
      print("\nYour posts:");
      User userPosts = signInUsersList[0];
      print(userPosts.getUserPosts);
      List list = userPosts.getFollowers;
      print("Followers posts:");
      for (User user in list) {
        print(user.getUserPosts);
      }
      build();
      return;
    } else if (command == 2) {
      print("");
      print(users);
      print("1. Exit");
      stdout.write("Select user: ");
      String selectUser = io.text;
      if (selectUser == "1") {
        build();
        return;
      }
      for (User user in users) {
        if (user.fullname == selectUser) {
          print(user.getUserPosts);
          stdout.write("Select post: ");
          String selectedPost = stdin.readLineSync() ?? "0";
          for (Post post in user.getUserPosts) {
            if (post.title == selectedPost) {
              print("\n1. Like");
              print("2. Remove like");
              print("3. Exit");
              stdout.write("Enter command: ");
              int likeCommand = io.number;
              if (likeCommand == 1) {
                post.likeCount++;
                print("You liked ${post.title} post");
                post.writeLikes(user);
                build();
                return;
              } else if (likeCommand == 2) {
                post.likeCount = post.likeCount-- < 0 ? 0 : post.likeCount--;
                print("You remove liked ${post.title} post");
                build();
                return;
              } else if (likeCommand == 3) {
                build();
                return;
              } else {
                print("Wrong command!!!\nPlease try again!!!\n");
                build();
                return;
              }
            }
          }
          print("Post is not found!!!\n");
          build();
          return;
        }
      }
      print("User doesn't exist!!!\n");
      build();
      return;
    } else if (command == 3) {
      User user = signInUsersList[0];
      print(user.getUserPosts);
      String selectedPost = stdin.readLineSync() ?? "0";
      for (Post post in user.getUserPosts) {
        if (post.title == selectedPost) {
          print("1. Delete post");
          print("2. Exit");
          stdout.write("Enter command: ");
          int postCommand = io.number;
          if (postCommand == 1) {
            user.removePost(post);
            print("\nYour post has been deleted!\n");
            build();
            return;
          } else if (postCommand == 2) {
            print("\nReturning to Home page!\n");
            HomePage();
            return;
          } else {
            print("\nWrong command!!!\nPlease try again!!!\n");
            build();
            return;
          }
        }
      }
    } else if (command == 4) {
      print("Returning to Home page");
      HomePage();
      return;
    } else {
      print("Invalid command!!!\nPlease try again!!!");
      build();
      return;
    }
  }
}

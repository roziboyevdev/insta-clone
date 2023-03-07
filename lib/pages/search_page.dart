import 'dart:io';

import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class SearchPage extends StateWidget {
  void build() {
    print(users);
    print("1. Exit");
    stdout.write("Select user: ");
    String selectUser = io.text;
    if (selectUser == "1") {
      HomePage();
      build();
    }
    for (User user in users) {
      if (selectUser == user.fullname) {
        print("1. Follow for $selectUser");
        print("2. Unfollow for $selectUser");
        print("3. Exit");
        stdout.write("Enter command: ");
        int followCommand = io.number;
        if (followCommand == 1) {
          print("$user user followers: ");
          user.writeFollow(signInUsersList[0]);
          print("");
          print("\nSuccessfully followed for $selectUser user\n");
          print(user.getFollowers);
          build();
          return;
        } else if (followCommand == 2) {
          user.removeFollow(signInUsersList[0]);
          print("\nSuccessfully unfollowed for $selectUser user\n");
          print(user.getFollowers);
          build();
          return;
        } else if (followCommand == 3) {
          HomePage();
          return;
        } else {
          print("Invalid command!!!\nPlease try again!!!");
          build();
          return;
        }
      }
    }
  }
}

import 'dart:io';

import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/sign_up_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class IntroPage extends StateWidget {
  @override
  void build() {
    print("Welcome to InstaClone");
    print("1. Sign In");
    print("2. Sign Up");
    stdout.write("Enter command: ");
    int command = io.number;
    if (command == 1) {
      print("");
      SignInPage();
    } else if (command == 2) {
      print("");
      SignUpPage();
    } else {
      print("Invalid command!!!\nPlease try again!!!\n");
      build();
      return;
    }
  }
}

import 'dart:io';

import 'package:insta_clone/database/users.dart';
import 'package:insta_clone/models/gender.dart';
import 'package:insta_clone/models/user.dart';
import 'package:insta_clone/pages/home_page.dart';
import 'package:insta_clone/pages/intro_page.dart';
import 'package:insta_clone/pages/sign_in_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class ProfilePage extends StateWidget {
  void build() {
    print("\nWelcome to Profile page");
    print("1. My posts");
    print("2. Edit account");
    print("3. Log out");
    print("4. Delete account");
    print("5. Exit");
    stdout.write("Enter command: ");
    int profileCommand = io.number;
    if (profileCommand == 1) {
      User user = signInUsersList[0];
      print("\nYour posts:");
      print(user.getUserPosts);
      build();
      return;
    } else if (profileCommand == 2) {
      io.console("Full name: ");
      String? name = io.text;

      io.console("Phone: ");
      String? phone = io.text;

      io.console("Email: ");
      String? email = io.text;

      io.console("Age: ");
      int? age = io.number;

      io.console("Gender: \n\t1. Male\n\t2. Female\n");
      int code = io.number;
      Gender? gender;
      if (code == 1) {
        gender = Gender.male;
      } else {
        gender = Gender.female;
      }

      io.console("Password: ");
      String? password = io.text;

      io.console("Confirm password: ");
      String? confirmPassword = io.text;
      if (password != confirmPassword) {
        print("Passwords are not equal!!!\nPlease try again!!!\n");
        build();
        return;
      }
      User user = signInUsersList[0];
      signInUsersList[0] = user.copyWith(
        name,
        phone,
        email,
        gender,
        age,
        password,
      );
      print("Your account edited!!!");
      print(signInUsersList[0]);
      build();
      return;
    } else if (profileCommand == 3) {
      print("Returning to Sign page");
      IntroPage();
      return;
    } else if (profileCommand == 4) {
      print("Do you want to delete a your account?");
      print("1. Yes");
      print("2. No");
      stdout.write("Enter command: ");
      int command = io.number;
      if (command == 1) {
        User user = signInUsersList[0];
        users.remove(user);
        print("Your account deleted!!!");
        print("Returning to Sign page");
        IntroPage();
        return;
      } else if (command == 2) {
        build();
        return;
      } else {
        print("Wrong command!!!\nPlease try again!!!");
        build();
        return;
      }
    } else if (profileCommand == 5) {
      print("Returning to Home page");
      HomePage();
      return;
    } else {
      print("Wrong command!!!\nPlease try again!!!");
      build();
      return;
    }
  }
}

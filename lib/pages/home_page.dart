import 'dart:io';

import 'package:insta_clone/pages/feeds_page.dart';
import 'package:insta_clone/pages/intro_page.dart';
import 'package:insta_clone/pages/like_page.dart';
import 'package:insta_clone/pages/post_page.dart';
import 'package:insta_clone/pages/profile_page.dart';
import 'package:insta_clone/pages/search_page.dart';
import 'package:insta_clone/pages/state_widget.dart';
import 'package:insta_clone/services/io_service.dart';

class HomePage extends StateWidget {
  @override
  void build() {
    print("\nWelcome to HomePage!");
    print("1. Feeds");
    print("2. Search");
    print("3. Post");
    print("4. Likes");
    print("5. Profile");
    print("6. Exit to sign menu");
    stdout.write("Enter command: ");
    int command = io.number;
    switch (command) {
      case 1:
        {
          FeedPage();
          break;
        }
      case 2:
        {
          SearchPage();
          break;
        }
      case 3:
        {
          CreatePost();
          break;
        }
      case 4:
        {
          LikePage();
          break;
        }
      case 5:
        {
          ProfilePage();
          break;
        }
      case 6:
        {
          IntroPage();
          break;
        }
      default:
        {
          print("Invalid command!!!");
          build();
        }
    }
  }
}

import 'package:insta_clone/models/gender.dart';
import 'package:insta_clone/models/user.dart';

final user1 =
    User("PDP", "+998787774747", "pdp@support.com", Gender.male, 6, "PDP@2023");
final user2 = User("Najot Ta'lim", "+998788889888", "najot@talim.com",
    Gender.male, 4, "NT@20223");

final users = [user1, user2];
User? currentUser;

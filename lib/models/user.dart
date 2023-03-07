import 'package:insta_clone/models/gender.dart';
import 'package:insta_clone/models/post.dart';

enum SortType { name, phone, email, age }

// TODO: update
class User implements Comparable<User> {
  int id;
  String fullname;
  String _phone;
  String _email;
  Gender gender;
  String password;
  final List<Post> _posts = [];
  final List<User> _followers = [];
  int _age;

  static int _userCount = 0;
  static SortType sortType = SortType.name;

  User._(this.id, this.fullname, this._phone, this._email, this.gender,
      this._age, this.password);

  factory User(String fullname, String phone, String email, Gender gender,
      int age, String password) {
    if (fullname.isEmpty) {
      throw Exception("Please fullname can't be empty!");
    }

    if (!RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      throw Exception("Please enter given form: +998#########");
    }

    if (!RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      throw Exception("Please enter valid email");
    }

    if (0 > age || age > 200) {
      throw Exception("Please enter valid age");
    }

    return User._(++_userCount, fullname, phone, email, gender, age, password);
  }

  User copyWith(
      [String? fullname,
      String? phone,
      String? email,
      Gender? gender,
      int? age,
      String? password]) {
    return User(
        fullname ?? this.fullname,
        phone ?? this.phone,
        email ?? this.email,
        gender ?? this.gender,
        age ?? this.age,
        password ?? this.password);
  }

  String get phone => _phone;

  set phone(String phone) {
    if (RegExp(r'^\+(\d){12}$').hasMatch(phone)) {
      _phone = phone;
    }
  }

  String get email => _email;

  set email(String email) {
    if (RegExp(r'^\w{3,}@[a-zA-Z]{3,}(\.)[a-zA-Z]{2,}$').hasMatch(email)) {
      _email = email;
    }
  }

  int get age => _age;

  set age(int age) {
    if (0 <= age && age <= 200) {
      _age = age;
    }
  }

  @override
  int compareTo(User user) {
    switch (sortType) {
      case SortType.name:
        int name = fullname.compareTo(user.fullname);
        return name;
      case SortType.phone:
        int phoneNumber = phone.compareTo(user.phone);
        return phoneNumber;
      case SortType.email:
        int emailAddress = email.compareTo(user.email);
        return emailAddress;
      case SortType.age:
        int ageComp = age.compareTo(user.age);
        return ageComp;
    }
  }

  @override
  noSuchMethod(Invocation invocation) {
    return "Please write correct method!";
  }

  @override
  int get hashCode => Object.hash(id, fullname, gender);

  @override
  bool operator ==(Object other) {
    return other is User &&
        id == other.id &&
        fullname == other.fullname &&
        gender == other.gender;
  }

  @override
  String toString() {
    return "$fullname $email $gender $age $phone";
  }

  void writePost(Post post) {
    _posts.add(post);
  }

  bool removePost(Post post) {
    return _posts.remove(post);
  }

  void writeFollow(User user) {
    _followers.add(user);
  }

  bool removeFollow(User user) {
    return _followers.remove(user);
  }

  get getFollowers => _followers;

  get getUserPosts => _posts;
}

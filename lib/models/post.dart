import 'package:insta_clone/models/user.dart';

enum PostSort {
  title,
  date,
  like,
}

class Post implements Comparable<Post> {
  int id;
  String title;
  String content;
  DateTime createdAt;
  int likeCount;
  String mediaUrl;
  static int countPost = 0;
  static PostSort sortType = PostSort.date;
  final List<User> _likes = [];

  Post({
    required this.title,
    required this.content,
    required this.mediaUrl,
  })  : id = ++countPost,
        createdAt = DateTime.now(),
        likeCount = 0;

  @override
  String toString() {
    return "$title: $content. Date: $createdAt. Likes: $likeCount";
  }

  @override
  noSuchMethod(Invocation invocation) {
    print("Please write correct method");
  }

  @override
  int get hashCode => Object.hash(id, title, content, mediaUrl);

  @override
  bool operator ==(Object other) {
    return other is Post &&
        id == other.id &&
        title == other.title &&
        content == other.content &&
        mediaUrl == other.mediaUrl;
  }

  @override
  int compareTo(Post post) {
    switch (sortType) {
      case PostSort.title:
        return title.compareTo(post.title);
      case PostSort.date:
        return createdAt.compareTo(post.createdAt);
      case PostSort.like:
        return likeCount.compareTo(post.likeCount);
    }
  }

  void writeLikes(User user) {
    _likes.add(user);
  }

  get getLikes => _likes;
}

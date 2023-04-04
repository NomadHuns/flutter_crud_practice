import 'package:http_riverpod_app/model/post/post.dart';

class PostRepository {
  static PostRepository _insteance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _insteance;
  }

  Future<List<Post>> findAll() {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return [
          Post(
            id: 1,
            title: "제목1",
          ),
          Post(
            id: 2,
            title: "제목2",
          ),
          Post(
            id: 3,
            title: "제목3",
          ),
        ];
      },
    );
  }

  Future<Post> save(String title) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {
        return Post(
          id: 4,
          title: "$title",
        );
      },
    );
  }

  Future<void> deleteById(int id) {
    return Future.delayed(
      const Duration(seconds: 1),
    );
  }

  Future<Post> updateById(Post post) {
    return Future.delayed(
      const Duration(seconds: 1),
          () {
        return post;
      },
    );
  }
}

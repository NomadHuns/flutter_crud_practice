import 'package:http_riverpod_app/model/post/post.dart';
import 'package:dio/dio.dart';

class PostRepository {
  final dio = Dio();
  static PostRepository _insteance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _insteance;
  }

  Future<List<Post>> findAll() async {
    Response response = await dio.get("https://jsonplaceholder.typicode.com/posts");
    List<dynamic> mapList = response.data;
    return mapList.map((e) => Post.fromJson(e)).toList();
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

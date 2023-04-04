import 'package:http_riverpod_app/dto/post_response_dto.dart';

class PostRepository {
  static PostRepository _insteance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _insteance;
  }

  Future<List<PostDto>> findAll() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return [
          PostDto(
            id: 1,
            title: "제목1",
          ),
          PostDto(
            id: 2,
            title: "제목2",
          ),
          PostDto(
            id: 3,
            title: "제목3",
          ),
        ];
      },
    );
  }

  Future<void>? save() {
    return null;
  }
}

import 'package:http_riverpod_app/view/home/dto/home_page_response_dto.dart';

class PostRepository {
  static PostRepository _insteance = PostRepository._single();

  PostRepository._single();

  factory PostRepository() {
    return _insteance;
  }

  Future<List<HomaPagePostDto>> findAll() {
    return Future.delayed(
      Duration(seconds: 1),
      () {
        return [
          HomaPagePostDto(
            id: 1,
            title: "제목1",
          ),
          HomaPagePostDto(
            id: 2,
            title: "제목2",
          ),
          HomaPagePostDto(
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


import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/dto/post_response_dto.dart';
import 'package:http_riverpod_app/repository/post_repository.dart';
import 'package:http_riverpod_app/view/home/home_page_view_model.dart';

final postController = Provider<PostController>((ref) { // @Component와 같다.
  return PostController(ref);
});

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<PostDto> homePagePostDtos = await PostRepository().findAll();
    ref.read(homePageViewModel.notifier).state = HomePageModel(posts: homePagePostDtos);
  }
}
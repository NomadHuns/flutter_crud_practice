
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/model/post/post_repository.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

final postController = Provider<PostController>((ref) { // @Component와 같다.
  return PostController(ref);
});

class PostController {

  Ref ref;
  PostController(this.ref);

  Future<void> findPosts() async {
    List<Post> postDtoList = await PostRepository().findAll();
    ref.read(postHomePageProvider.notifier).init(postDtoList);
  }
}
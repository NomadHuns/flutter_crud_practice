import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/model/post/post.dart';

// 창고 관리자 (Provider)
final postHomePageProvider = StateNotifierProvider<PostHomePageViewModel, PostHomePageModel?>((ref) {
  return PostHomePageViewModel(null);
});

// 창고 (Store)
class PostHomePageViewModel extends StateNotifier<PostHomePageModel?>{
  PostHomePageViewModel(super.state);

  void init(List<Post> postDtoList) {
    state = PostHomePageModel(posts: postDtoList);
  }

  void add(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = [...posts, post]; // 변경 감지는 레퍼런스 주소가 달라져야 한다. (깊은 복사 방식)
    posts.add(post); // 새로운 객체를 들고오므로 다음과 같은 경우에도 가능하다.
    state = PostHomePageModel(posts: newPosts); // 값이 동일해도, 레퍼런스 주소가 달라지면 빌드한다.
  }

  void remove(int id) {
    List<Post> posts = state!.posts;
    // 검색과 삭제
    List<Post> newPosts = posts.where((e) => e.id != id).toList(); // where() 안의 조건이 true라면 newList로 들어가고, false면 들어가지 않는다.
    state = PostHomePageModel(posts: newPosts);
  }

  void update(Post post) {
    List<Post> posts = state!.posts;
    List<Post> newPosts = posts.map((e) => e.id == post.id ? post : e).toList();
    state = PostHomePageModel(posts: newPosts);
  }
}

// 창고 데이터
class PostHomePageModel {
  List<Post> posts;

  PostHomePageModel({required this.posts});
}
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/controller/post_controller.dart';
import 'package:http_riverpod_app/model/post/post.dart';
import 'package:http_riverpod_app/view/pages/post/home/post_home_page_view_model.dart';

class PostHomePage extends ConsumerWidget {
  const PostHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    PostController postCon = ref.read(postController);
    PostHomePageModel? postHomePageModel = ref.watch(postHomePageProvider);

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: postHomePageModel != null
                ? _buildListView(postHomePageModel.posts)
                : _buildListView([]),
          ),
          ElevatedButton(
            onPressed: () {
              postCon.findPosts();
            },
            child: const Text("페이지로드"),
          ),
          ElevatedButton(
            onPressed: () {
              postCon.addPost("제목4");
            },
            child: const Text("한건추가"),
          ),
          ElevatedButton(
            onPressed: () {
              postCon.removePost(1);
            },
            child: const Text("한건삭제"),
          ),
          ElevatedButton(
            onPressed: () {
              postCon.updatePost(Post(id: 2, title: "제목이용"));
            },
            child: const Text("한건수정"),
          ),
        ],
      ),
    );
  }

  ListView _buildListView(List<Post> posts) {
    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text("${posts[index].id}"),
          title: Text("${posts[index].title}"),
        );
      },
    );
  }
}

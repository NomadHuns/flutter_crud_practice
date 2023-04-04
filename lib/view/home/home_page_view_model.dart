import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_riverpod_app/view/home/dto/home_page_response_dto.dart';

// 창고 관리자 (Provider)
final homePageViewModel = StateNotifierProvider<HomePageViewModel, HomePageModel>((ref) {
  return HomePageViewModel(HomePageModel(posts: []));
});

// 창고 (Store)
class HomePageViewModel extends StateNotifier<HomePageModel>{
  HomePageViewModel(super.state);

}

// 창고 데이터
class HomePageModel {
  List<HomaPagePostDto>? posts;

  HomePageModel({this.posts});
}
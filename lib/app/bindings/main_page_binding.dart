import 'package:get/get.dart';
import 'package:hojung/app/controllers/auth_controller.dart';
import 'package:hojung/app/controllers/posts_controller.dart';
import 'package:hojung/app/data/providers/posts_provider.dart';
import 'package:hojung/app/data/repositories/posts_repository.dart';
import 'package:hojung/app/controllers/main_page_view_controller.dart';

class MainPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainPageViewController());
    Get.put(PostsController(
        postsRepository: PostsRepository(postsProvider: PostsProvider())));
    Get.put(AuthController());
  }
}

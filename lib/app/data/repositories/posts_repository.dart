import 'package:hojung/app/data/providers/posts_provider.dart';

class PostsRepository {
  final PostsProvider postsProvider;

  PostsRepository({required this.postsProvider});

  load(String date) {
    return postsProvider.load(date);
  }
}
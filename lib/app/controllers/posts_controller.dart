import 'dart:developer';

import 'package:get/get.dart';
import 'package:hojung/app/data/repositories/posts_repository.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';

class PostsController extends GetxController {
  PostsController({required this.postsRepository}) {
    pagingController.addPageRequestListener((pageKey) {
      load();
    });
  }

  final PostsRepository postsRepository;
  final _pagingController = PagingController(firstPageKey: 0).obs;

  get pagingController => _pagingController.value;


  load() async {
    String date = pagingController.itemList == null ? DateFormat('yyyy. MM. dd. a hh:mm:ss', 'ko').format(DateTime.now()) : pagingController.itemList[pagingController.itemList.length - 1].date;

    try {
      await postsRepository.load(date).then((data) {
        log("data.length : ${data.length}");

        if (data.length < 20) {
          pagingController.appendLastPage(data);
          log('Last Page');
        } else {
          pagingController.appendPage(
              data, pagingController.nextPageKey);
        }

        log(pagingController.itemList.length.toString());
        log('nextPageKey : ${pagingController.nextPageKey.toString()}');
      });
    } catch (e) {
      log(e.toString());
      pagingController.error = e;
    }
  }

  @override
  refresh() async {
    pagingController.refresh();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/posts_controller.dart';
import 'package:hojung/app/view/widgets/home_page/home_page_list_item.dart';
import 'package:hojung/app/view/widgets/global/reuseable_button.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<PostsController>(
      builder: (controller) => RefreshIndicator(
          child: PagedListView(
            pagingController: controller.pagingController,
            builderDelegate: PagedChildBuilderDelegate(
              itemBuilder: (context, item, index) {
                return HomePageListItem(item);
              },
              firstPageErrorIndicatorBuilder: (context) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReuseableButton(
                      onTap: () => controller.refresh(),
                      text: 'Retry',
                      borderRadius: 20,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
          onRefresh: () =>
              Future.sync(() => controller.refresh())),
    );
  }
}
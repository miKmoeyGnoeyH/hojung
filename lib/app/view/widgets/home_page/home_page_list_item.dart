import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/routes/app_pages.dart';
import 'package:hojung/app/view/widgets/home_page/home_page_list_img.dart';
import 'package:hojung/app/view/widgets/home_page/home_page_list_price.dart';
import 'package:hojung/app/view/widgets/home_page/home_page_list_title.dart';

class HomePageListItem extends StatelessWidget {
  const HomePageListItem(this.post, {super.key});

  final dynamic post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(Routes.detailsPage, arguments: post),
      child: Container(
        height: 130,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              width: 0.3,
              color: Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 13),
          child: Row(
            children: [
              HomePageListImg(imgUrl: post.imageUrl),
              const SizedBox(width: 16),
              Expanded(
                child: SizedBox(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HomePageListTitle(title: post.title.toString()),
                      HomePageListPrice(price: post.price.toString()),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/odds/custom_icons.dart';
import 'package:hojung/app/view/pages/chat_page.dart';
import 'package:hojung/app/view/pages/home_page.dart';
import 'package:hojung/app/view/pages/profile_page.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';
import 'package:hojung/app/controllers/main_page_view_controller.dart';

class MainPageView extends StatelessWidget {
  MainPageView({super.key});

  final List<String> titles = ['홈', '채팅', '프로필'];

  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  void onPageChanged(int index) {
    Get
        .find<MainPageViewController>()
        .selectedPageIndex = index;
  }

  void onTap(int index) {
    Get
        .find<MainPageViewController>()
        .selectedPageIndex = index;
    _pageController.jumpToPage(
        index);
  }

  AppBar buildMainPageAppbar(BuildContext context, String title) {
    return buildAppbar(context, title);
  }

  PageView buildMainPageBody() {
    return PageView(
      controller: _pageController,
      onPageChanged: (index) {
        onPageChanged(index);
      },
      children: const [
        HomePage(),
        ChatPage(),
        ProfilePage(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetX<MainPageViewController>(
      builder: (controller) =>
          Scaffold(
            appBar: buildMainPageAppbar(context, titles[controller.selectedPageIndex]),
            body: buildMainPageBody(),
            bottomNavigationBar: SafeArea(
              child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(width: 0.3, color: Theme.of(context).colorScheme.onBackground.withOpacity(0.5)),
                  )
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
                    selectedFontSize: 10,
                    unselectedFontSize: 10,
                    enableFeedback: false,
                    currentIndex: controller.selectedPageIndex,
                    selectedItemColor: Theme.of(context).colorScheme.primary,
                    onTap: (index) {
                      onTap(index);
                    },
                    items: [
                      BottomNavigationBarItem(
                          icon: const Icon(CustomIcons.home_outlined), label: titles[0]),
                      BottomNavigationBarItem(
                          icon: const Icon(CustomIcons.chat_outlined), label: titles[1]),
                      BottomNavigationBarItem(
                          icon: const Icon(CustomIcons.profile_outlined), label: titles[2]),
                    ],
                  ),
                ),
              ),
            ),
          ),
    );
  }

}

import 'package:get/get.dart';

class MainPageViewController extends GetxController {
  final _selectedPageIndex = 0.obs;
  get selectedPageIndex => _selectedPageIndex.value;
  set selectedPageIndex(value) => _selectedPageIndex.value = value;
}
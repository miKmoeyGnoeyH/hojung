import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hojung/app/controllers/auth_controller.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_contact_to_seller_button.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_content.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_summary.dart';
import 'package:hojung/app/view/widgets/global/custom_appbar.dart';

class DetailsPage extends StatelessWidget {
  DetailsPage({super.key});

  final String title = Get.arguments.title;
  final String saleStatus = Get.arguments.saleStatus;
  final String price = Get.arguments.price;
  final String username = Get.arguments.username;
  final String content = Get.arguments.content;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppbar(context, '', centertitle: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color:
                    Theme.of(context).colorScheme.onBackground.withOpacity(0.5),
              ),
            ),
            DetailSummary(
              title: title,
              saleStatus: saleStatus,
              price: price,
              username: username,
            ),
            DetailContent(content),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
          ],
        ),
      ),
      floatingActionButton: DetailContactToSellerButton(
          () => Get.find<AuthController>().contactToSeller()),
    );
  }
}
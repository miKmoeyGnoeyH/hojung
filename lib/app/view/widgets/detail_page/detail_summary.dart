import 'package:flutter/material.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_sale_status.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_seller_profile.dart';
import 'package:hojung/app/view/widgets/detail_page/detail_title.dart';

class DetailSummary extends StatelessWidget {
  const DetailSummary({
    super.key,
    required this.title,
    required this.saleStatus,
    required this.price,
    required this.username,
  });

  final String title;
  final String saleStatus;
  final String price;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 0.3,
                  color: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5)))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10.0),
        child: DetailSummaryContent(
          title: title,
          saleStatus: saleStatus,
          price: price,
          username: username,
        ),
      ),
    );
  }
}

class DetailSummaryContent extends StatelessWidget {
  const DetailSummaryContent({
    super.key,
    required this.title,
    required this.saleStatus,
    required this.price,
    required this.username,
  });

  final String title;
  final String saleStatus;
  final String price;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DetailTitle(title),
        const SizedBox(height: 20),
        DetailSaleStatus(saleStatus: saleStatus, price: price),
        const SizedBox(height: 10),
        DetailSellerProfile(username),
      ],
    );
  }
}
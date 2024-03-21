import 'package:intl/intl.dart';

class PostModel {
  final String? id;
  final String? username;
  final String? hashedUserName;
  final String? title;
  final String? price;
  final String? selling;
  final String? saleStatus;
  final String? content;
  final String? imageUrl;
  final List<dynamic>? imageUrls;
  final String? date;
  final bool? changed;

  PostModel()
      : id = '',
        username = '',
        hashedUserName = '',
        title = '',
        price = '',
        selling = '',
        saleStatus = '',
        content = '',
        imageUrl = '',
        imageUrls = [],
        date = '',
        changed = false;

  PostModel.fromJson(Map<String, dynamic> json)
      : id = json['_id'],
        username = json['username'],
        hashedUserName = json['hashedUsername'],
        title = json['title'],
        price = json['price'] == null ? '나눔' : '${NumberFormat('###,###,###,###').format(int.parse(json['price']))}원',
        selling = json['selling'],
        saleStatus = json['salesStatus'],
        content = json['content'],
        imageUrl = json['imageUrl'],
        imageUrls = json['imageUrls'],
        date = json['date'],
        changed = json['changed'];
}

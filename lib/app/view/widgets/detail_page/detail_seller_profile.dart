import 'package:flutter/material.dart';
import 'package:hojung/app/odds/custom_icons.dart';
class DetailSellerProfile extends StatelessWidget {
  const DetailSellerProfile(this.username, {
    super.key,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const DetailSellerProfileIcon(),
        const SizedBox(width: 10),
        Text(username),
      ],
    );
  }
}

class DetailSellerProfileIcon extends StatelessWidget {
  const DetailSellerProfileIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .colorScheme
            .onBackground
            .withOpacity(0.3),
        borderRadius: BorderRadius.circular(50),
      ),
      child: Icon(
        CustomIcons.profile_outlined,
        size: 15,
        color: Theme.of(context)
            .colorScheme
            .onBackground
            .withOpacity(0.5),
      ),
    );
  }
}
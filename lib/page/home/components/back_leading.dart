import 'package:flutter/material.dart';
import 'package:youapp_test/common/styles.dart';

class BackLeading extends StatelessWidget {
  final void Function() onTap;
  const BackLeading({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Icon(
              Icons.chevron_left,
              size: 25,
              color: hWhite,
            ),
            Text('Back', style: AppTextStyle.bold())
          ],
        ),
      ),
    );
  }
}

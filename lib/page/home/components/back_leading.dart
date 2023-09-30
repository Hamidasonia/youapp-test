import 'package:flutter/material.dart';
import 'package:youapp_test/common/styles.dart';

class BackLeading extends StatelessWidget {
  const BackLeading({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: InkWell(
        onTap: () => Navigator.pop(context),
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

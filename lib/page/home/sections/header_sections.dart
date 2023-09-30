part of '../home_page.dart';

class _HeaderSections extends StatefulWidget {

  @override
  State<_HeaderSections> createState() => _HeaderSectionsState();
}

class _HeaderSectionsState extends State<_HeaderSections> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 17,
      ),
      height: 190,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          color: hCard),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          '@jhondoe123',
          style: AppTextStyle.bold(fontSize: 16),
        ),
      ),
    );
  }
}

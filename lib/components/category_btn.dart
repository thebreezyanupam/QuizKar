// components/my_category_btn.dart
import 'package:flutter/material.dart';

class MyCategoryBtn extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String routeName;

  const MyCategoryBtn({
    required this.title,
    required this.iconData,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the respective screen when the container is pressed
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [BoxShadow(color: Theme.of(context).colorScheme.tertiary,
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 3),)],
            color: Theme.of(context).colorScheme.background, borderRadius: BorderRadius.circular(20)),
        width: 80,
        height: 80,
        margin: const EdgeInsets.only(right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconData, color: Theme.of(context).colorScheme.secondary, size: 30,),
            Text(title, style: TextStyle(color: Theme.of(context).colorScheme.secondary,)),
          ],
        ),
      ),
    );
  }
}

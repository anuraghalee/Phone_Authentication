import 'package:flutter/material.dart';

class Appbar extends StatefulWidget implements PreferredSizeWidget {
  const Appbar({
    super.key,
    required this.ic,
  });

  final Icon ic;

  @override
  State<Appbar> createState() => _AppbarState();

  @override
  Size get preferredSize => const Size(double.maxFinite, 80);
}

class _AppbarState extends State<Appbar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    widget.ic == const Icon(Icons.arrow_back) ? Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false) : Navigator.pop(context);
                  },
                  icon: widget.ic,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

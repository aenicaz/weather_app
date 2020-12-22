import 'package:flutter/material.dart';

class IconButton extends StatelessWidget {
  IconButton({@required this.icon, @required this.function});

  final IconData icon;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      child: RawMaterialButton(
        child: Icon(
          icon,
          size: 27,
        ),
        onPressed: function,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}

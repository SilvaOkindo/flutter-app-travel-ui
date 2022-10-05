import 'package:flutter/cupertino.dart';

class ItemBarPage extends StatelessWidget {
  const ItemBarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Item Bar Page",
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }
}

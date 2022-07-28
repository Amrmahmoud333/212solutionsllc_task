import 'package:flutter/material.dart';

class WeightListItem extends StatelessWidget {
  const WeightListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Text('data'),
              Text('data'),
            ],
          ),
          Text('data'),
        ],
      ),
    );
  }
}

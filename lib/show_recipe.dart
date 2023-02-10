import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class ShowRecipe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 112,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Text("dete");
          }),
    );
  }
}

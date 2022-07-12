import 'package:flutter/material.dart';
import 'package:mmt_project/Jay_Pages/Page1.dart';
import 'package:mmt_project/Jay_Pages/Page2.dart';
import 'package:mmt_project/Jay_Pages/Page3.dart';
import 'package:mmt_project/Jay_Pages/Page4.dart';


class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return PageView(
                  /// [PageView.scrollDirection] defaults to [Axis.horizontal].
      /// Use [Axis.vertical] to scroll vertically.
      controller: controller,
      scrollDirection: Axis.horizontal,
      children: const [
          Center(child: Page1()),
          Center(child: Page2()),
          Center(child: Page3()),
          Center(child: Page4()),
      ],
    );
  }
}


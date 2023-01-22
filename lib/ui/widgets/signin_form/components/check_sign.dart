import 'package:flutter/cupertino.dart';

class ContainerForSign extends StatelessWidget {
  final Widget child;

  const ContainerForSign({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Column(
        children: [
          const Spacer(),
          Container(height: 100, width: 100, child: child),
          const Spacer(),
        ],
      ),
    );
  }
}

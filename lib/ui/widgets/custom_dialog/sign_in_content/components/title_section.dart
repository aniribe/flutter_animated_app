import 'package:flutter/cupertino.dart';

import '../../../../../consts/string_consts.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      StringConsts.signIn,
      style: TextStyle(
        fontSize: 34,
        fontFamily: StringConsts.poppinsFamily,
      ),
    );
  }
}

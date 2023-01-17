import 'package:flutter/cupertino.dart';

import '../../../../consts/string_consts.dart';
import '../../../ui_helpers.dart';

class PageTitleAndSlogan extends StatelessWidget {
  const PageTitleAndSlogan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      child: Column(
        children: [
          const Text(
            StringConsts.learnDesignPhrase,
            style: TextStyle(
              fontSize: 60,
              fontFamily: StringConsts.poppinsFamily,
              height: 1.2,
            ),
          ),
          verticalSpace(16),
          const Text(StringConsts.promoPhrase)
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';

import '../../../../consts/string_consts.dart';

class PromoText extends StatelessWidget {
  const PromoText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 24),
      child: Text(StringConsts.purchasePhrase),
    );
  }
}

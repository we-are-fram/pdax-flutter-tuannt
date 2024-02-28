import 'package:flutter/material.dart';

import '../../utils/my_const/COLOR_CONST.dart';
import '../../utils/my_const/FONT_CONST.dart';

class WidgetHomeToolbar extends StatefulWidget {
  @override
  _WidgetHomeToolbarState createState() => _WidgetHomeToolbarState();
}

class _WidgetHomeToolbarState extends State<WidgetHomeToolbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: COLOR_CONST.BLUE,
      height: 70,
      child: Row(
        children: <Widget>[_buildNames()],
      ),
    );
  }

  _buildNames() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('People Exam', style: FONT_CONST.SEMIBOLD_WHITE_16)
          ],
        ),
      ),
    );
  }
}

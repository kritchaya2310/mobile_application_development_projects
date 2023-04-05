import 'package:flutter/material.dart';

import '../setting_page/setting_page.dart';

// class DrawerBookmark extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: null,
//       child: Container(
//         width: 80,
//         height: 80,
//         decoration: BoxDecoration(
//             color: Colors.white,
//             border: Border.all(color: Colors.black, width: 3),
//             borderRadius: BorderRadius.all(Radius.circular(60))),
//         child: Icon(
//           Icons.bookmark,
//           size: 40,
//         ),
//       ),
//     );
//   }
// }

class DrawerSetting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SettingPage()),
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black, width: 3),
            borderRadius: BorderRadius.all(Radius.circular(60))),
        child: Icon(
          Icons.settings,
          size: 40,
        ),
      ),
    );
  }
}

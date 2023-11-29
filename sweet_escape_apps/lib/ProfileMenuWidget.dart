import 'package:flutter/material.dart';
import 'ProfileScreen.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

// import '../../../../../constants/colors.dart';

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    const Color tPrimaryColor = Colors.blue;
    const Color tDarkColor = Colors.black;
    const Color tAccentColor = Color.fromARGB(255, 241, 213, 189);

    var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    var iconColor = isDark ? tPrimaryColor : tAccentColor;

    return ListTile(
      onTap: onPress,
      leading: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          width: lebar * 0.1,
          height: tinggi * 0.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: iconColor.withOpacity(0.5),
          ),
          child: Icon(icon, color: Color.fromARGB(255, 53, 101, 111)),
        ),
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Color.fromRGBO(10, 10, 10, 1.0),
        ),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: const Icon(LineAwesomeIcons.angle_right,
                  size: 18.0, color: Color.fromARGB(255, 53, 101, 111)))
          : null,
    );
  }
}

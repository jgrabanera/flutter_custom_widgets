// ignore_for_file: must_be_immutable

import 'package:custom_widgets/library.dart';

class IconBtn extends StatelessWidget {
  IconBtn(
      {super.key,
      required this.isLoading,
      this.customText,
      this.onPress,
      this.customColor,
      this.customIcon});

  bool isLoading = false;
  String? customText;
  VoidCallback? onPress;
  Color? customColor;
  Widget? customIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: customIcon ??
          Icon(
            Icons.login_rounded,
            color: Colors.white,
          ),
      style: TextButton.styleFrom(
        maximumSize: const Size.fromWidth(150),
        fixedSize: const Size.fromHeight(45),
        backgroundColor: customColor ?? Colors.green,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      ),
      label: Text(
        customText ?? 'BUTTON',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onPressed: onPress,
    );
  }
}

class LoginBtn extends StatelessWidget {
  LoginBtn(
      {super.key,
      required this.isLoading,
      this.customText,
      this.onPress,
      this.customColor,
      this.customIcon});

  bool isLoading = false;
  String? customText;
  VoidCallback? onPress;
  Color? customColor;
  Widget? customIcon;

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      icon: customIcon ??
          Icon(
            Icons.login_rounded,
            color: Colors.white,
          ),
      style: TextButton.styleFrom(
        maximumSize: const Size.fromWidth(150),
        fixedSize: const Size.fromHeight(45),
        backgroundColor: customColor ?? Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      label: Text(
        customText ?? 'LOGIN',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onPressed: onPress,
    );
  }
}

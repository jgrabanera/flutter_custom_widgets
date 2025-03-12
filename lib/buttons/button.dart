// ignore_for_file: must_be_immutable

import 'package:custom_widgets/library.dart';

class ButtonsContainer extends StatefulWidget {
  const ButtonsContainer({super.key});

  @override
  State<ButtonsContainer> createState() => _ButtonsContainerState();
}

class _ButtonsContainerState extends State<ButtonsContainer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        color: Colors.white,
        height: double.maxFinite,
        width: double.maxFinite,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 25,
            children: <Widget>[
              IconBtn(isLoading: false),
              LoginBtn(isLoading: false),
              HoverBtn(isLoading: false),
              OutlinedBtn(isLoading: false)
              // const RegistrationForm(),
            ],
          ),
        ),
      ),
    );
  }
}

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

class HoverBtn extends StatefulWidget {
  HoverBtn(
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
  State<HoverBtn> createState() => _HoverBtnState();
}

class _HoverBtnState extends State<HoverBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: widget.customIcon ??
          Icon(
            Icons.login_rounded,
            color: Colors.white,
          ),
      style: TextButton.styleFrom(
        maximumSize: const Size.fromWidth(150),
        fixedSize: const Size.fromHeight(45),
        backgroundColor: widget.customColor ?? Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      label: Text(
        widget.customText ?? 'LOGIN',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onPressed: widget.onPress,
    );
  }
}

class OutlinedBtn extends StatefulWidget {
  OutlinedBtn(
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
  State<OutlinedBtn> createState() => _OutlinedBtnState();
}

class _OutlinedBtnState extends State<OutlinedBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: TextButton.styleFrom(
        maximumSize: const Size.fromWidth(150),
        fixedSize: const Size.fromHeight(45),
        backgroundColor: widget.customColor ?? Colors.green,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      ),
      label: Text(
        widget.customText ?? 'OUTLINED',
        style:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
      ),
      onPressed: widget.onPress,
    );
  }
}

// ignore_for_file: use_build_context_synchronously

import 'package:custom_widgets/library.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Poppins',
      ),
      home: const MyHomePage(title: 'Flutter Custom Widgets'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Stores states for each button
  Map<String, bool> isLoadingMap = {};

  void setLoading(String key, bool value) {
    // Update loading state for specific button
    setState(() {
      isLoadingMap[key] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        width: double.maxFinite,
        color: Colors.white,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 30,
          children: <Widget>[
            IconBtn(
              isLoading: isLoadingMap["forms"] ?? false,
              customColor: Colors.teal,
              customText: 'FORMS',
              customIcon: isLoadingMap["forms"] ?? false
                  ? _loadingIndicator()
                  : Icon(Icons.list_alt_rounded, color: Colors.white),
              onPress: () async {
                setLoading("forms", true);
                // await Future.delayed(Duration(seconds: 1));
                if (mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FormsContainer()));
                }
                setLoading("forms", false);
              },
            ),
            IconBtn(
              isLoading: isLoadingMap["buttons"] ?? false,
              customColor: Colors.deepOrange,
              customText: 'BUTTONS',
              customIcon: isLoadingMap["buttons"] ?? false
                  ? _loadingIndicator()
                  : Icon(Icons.radio_button_checked_rounded,
                      color: Colors.white),
              onPress: () async {
                setLoading("buttons", true);
                await Future.delayed(Duration(seconds: 1));
                if (mounted) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ButtonsContainer()));
                }
                setLoading("buttons", false);
              },
            ),
            IconBtn(
              isLoading: isLoadingMap["tables"] ?? false,
              customColor: Colors.blueAccent,
              customText: 'TABLES',
              customIcon: isLoadingMap["tables"] ?? false
                  ? _loadingIndicator()
                  : Icon(Icons.table_chart_rounded, color: Colors.white),
              onPress: () async {
                setLoading("tables", true);
                await Future.delayed(Duration(seconds: 1));
                setLoading("tables", false);
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _loadingIndicator() {
    return SizedBox(
      width: 14,
      height: 14,
      child: CircularProgressIndicator(
        strokeWidth: 2,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }
}

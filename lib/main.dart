import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_toggle_tab/flutter_toggle_tab.dart';
import 'package:flutter_toggle_tab/helper.dart';
import 'package:flutter/src/material/tab_controller.dart';
import './FirstScreen.dart';
import './SecondScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Your Plan'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, controller, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  var _tabTextIndexSelected = 1;
  var _tabTextIconIndexSelected = 0;
  var _tabIconIndexSelected = 0;
  var _tabSelectedIndexSelected = 0;
  var _listTextTabToggle = ["Credit Card", "Paypal"];
  var _listTextSelectedToggle = ["Credit Card", "Paypal"];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    //TabController tabController = TabController(length: 2, vsync: this);
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Your Plan",
                          style: TextStyle(
                              fontSize: 32, height: 1, color: Colors.black)),
                      TextSpan(
                          //textAlign:TextAlign.right,
                          text: "                    Change→",
                          style: TextStyle(
                              fontSize: 22, height: 1, color: Colors.black)),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  indent: 5,
                  endIndent: 5,
                ),
                Text(
                  "Premium",
                  style: TextStyle(fontSize: 28),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "\$9.99",
                          style: TextStyle(
                              fontSize: 32,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              height: 1.5)),
                      TextSpan(
                          text: "/month",
                          style: TextStyle(fontSize: 15, color: Colors.grey)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                          text: "Cancel anytime.",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey, height: 2)),
                      TextSpan(
                          text: "Offer terms",
                          style: TextStyle(fontSize: 15, color: Colors.blue)),
                      TextSpan(
                          text: " apply.",
                          style: TextStyle(
                              fontSize: 15, color: Colors.grey, height: 2)),
                    ],
                  ),
                ),
                Divider(color: Colors.grey, indent: 5, endIndent: 5),
                FlutterToggleTab(
// width in percent
                  width: 60,
                  borderRadius: 20,
                  height: 40,
                  selectedIndex: _tabTextIndexSelected,
                  selectedBackgroundColors: [Colors.blue, Colors.blue],
                  //controller:tabController,
                  //indicator: BoxDecoration(color: Colors.white),

                  selectedTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                  unSelectedTextStyle: TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                  labels: _listTextTabToggle,
                  selectedLabelIndex: (index) {
                    setState(() {
                      _tabTextIndexSelected = index;
                    });
                  },

                  isScroll: true,
                ),
                Expanded(
                    child: TabBarView(
                  children: [
                    FirstScreen(),
                    FirstScreen(),
                  ],
                )),
              ],
            ),
          ),
        ), //safe area
      ),
    );
  }
}

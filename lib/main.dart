
import 'package:flutter/material.dart';
import 'package:navigator/view/next_page.dart';

import 'base_widget.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends BaseWidget {
  // @override
  // BaseWidgetState<BaseWidget> getState() {
  //   return _HomePageWidgetState();
  // }

  @override
  State<StatefulWidget> createState() {
    return _HomePageWidgetState();
  }
}

class _HomePageWidgetState<T> extends BaseWidgetState<HomePage> {
  @override
  String curPage() => "_HomePageWidgetState";

  @override
  Widget baseBuild(BuildContext context) {
    // TODO: implement baseBuild
    //return super.baseBuild(context);
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          children: <Widget>[
            const Text("首页"),
            GestureDetector(
              onTap: () async {
                Navigator.push(context,
                    MaterialPageRoute(builder: (BuildContext context) {
                  return NextPage();
                }));
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "\n跳转下一页",
                  style: TextStyle(backgroundColor: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

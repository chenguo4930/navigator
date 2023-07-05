import 'package:flutter/material.dart';

import '../base_widget.dart';

class ThreePage extends BaseWidget {

  @override
  State<StatefulWidget> createState() {
    return _ThreePageWidgetState();
  }
}

class _ThreePageWidgetState<T> extends BaseWidgetState<ThreePage> {
  @override
  baseBuild(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 200.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("第三页"),
            GestureDetector(
              onTap: () async {
                Navigator.pop(context);
              },
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "\n返回上一页",
                  style: TextStyle(backgroundColor: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  String curPage() => "_ThreePageWidgetState";
}

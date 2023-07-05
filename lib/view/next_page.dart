import 'package:flutter/material.dart';

import '../base_widget.dart';

class NextPage extends BaseWidget {

  @override
  State<StatefulWidget> createState() {
    return _NextPageWidgetState();
  }
}

class _NextPageWidgetState<T> extends BaseWidgetState<NextPage> {

  @override
  Widget baseBuild(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 200),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            const Text("第二页"),
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
            ),
          ],
        ),
      ),
    );
  }

  @override
  String curPage() => "_NextPageWidgetState";
}

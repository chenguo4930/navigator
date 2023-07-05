import 'package:flutter/material.dart';

import 'navigator_manger.dart';

abstract class BaseWidget extends StatefulWidget {
  // @override
  // BaseWidgetState createState() {
  //   return getState();
  // }
  //
  // BaseWidgetState getState();
}

abstract class BaseWidgetState<T extends BaseWidget> extends State<T> {

  String tag = "BaseWidgetState_";
  bool _onResumed = false; //页面展示标记
  bool _onPause = false; //页面暂停标记

  String curPage();

  @override
  void initState() {
    super.initState();
    onCreate();
    tag = "$tag${curPage}_";
    print("${tag}initState\n");
    //添加page唯一标识到数组
    NavigatorManger().addWidget(context);
  }

  @override
  void didChangeDependencies() {
    print("${tag}didChangeDependencies\n");
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    print("${tag}build\n");
    if (!_onResumed) {
      //初次加载 顶部page
      if (NavigatorManger().isTopPage(context)) {
        _onResumed = true;
        onResume();
      }
    }
    return Scaffold(
      body: baseBuild(context),
    );
  }

  @override
  void didUpdateWidget(T oldWidget) {
    print("${tag}didUpdateWidget\n");
    super.didUpdateWidget(oldWidget);
  }

  @override
  void reassemble() {
    print("${tag}reassemble\n");
    super.reassemble();
  }

  @override
  void deactivate() {
    print("${tag}deactivate\n");
    //仅次于顶部的page
    if (NavigatorManger().isSecondTop(context)) {
      if (!_onPause) {
        onPause();
        _onPause = true;
      } else {
        onResume();
        _onPause = false;
      }
      //顶部page
    } else if (NavigatorManger().isTopPage(context)) {
      if (!_onPause) {
        onPause();
      }
    }
    super.deactivate();
  }

  @override
  void dispose() {
    print("${tag}dispose\n");
    _onResumed = false;
    _onPause = false;
    //把改页面 从 页面列表中 去除
    NavigatorManger().removeWidget(context);
    onDestroy();
    super.dispose();
  }

  void onCreate() {

  }

  void onResume() {
    print("${tag}onResume\n");
  }

  void onPause() {
    print("${tag}onPause\n");
  }

  Widget baseBuild(BuildContext context) {
    return const Placeholder();
  }

  void onDestroy() {}
}

import 'package:flutter/material.dart';

/// - 页面管理类
class NavigatorManger {
  final List<String?> _activityStack = <String>[];

  /// - 工厂模式
  factory NavigatorManger() => singleton;

  NavigatorManger._internal();

  static NavigatorManger singleton = NavigatorManger._internal();

  /// - 添加唯一标识到数组中
  void addWidget(BuildContext context) {
    print("BaseWidget__$context");
    _activityStack.add(getClassName(context));
  }

  /// - 移除唯一标识
  void removeWidget(BuildContext context) {
    _activityStack.remove(getClassName(context));
  }

  /// - 通过上下文获取page唯一标识
  String? getClassName(BuildContext? buildContext) {
    if (buildContext == null) {
      return null;
    }
    final className = buildContext.toString();
    if (className.isEmpty) {
      return null;
    }
    return className.substring(0, className.indexOf("("));
  }

  /// - 通过数组中标识队列，判断page的位置（是唯一最顶部，还是唯一最顶部之下的第二个page）
  bool isTop(BuildContext context, int num) {
    if (_activityStack.isEmpty) {
      return false;
    }
    try {
      final className = getClassName(context);
      final stackLength = _activityStack.length;
      final curIndex = (stackLength >= num) ? (stackLength - num) : -1;
      final stackClassName = curIndex >= 0 ? _activityStack[curIndex] : null;
      return stackClassName == className;
    } catch (exception) {
      return false;
    }
  }

  bool isTopPage(BuildContext context) {
    return isTop(context, 1);
  }

  bool isSecondTop(BuildContext context) {
    return isTop(context, 2);
  }
}

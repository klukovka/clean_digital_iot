import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

abstract class BaseRouter {
  final StackRouter stackRouter;

  const BaseRouter(this.stackRouter);

  // TabsRouter? getTabsRouter(BuildContext context);

  // Future<void> pushRoot();

  // Future<void> replaceWithRoot();

  T? getObserver<T extends AutoRouteObserver>(BuildContext context) {
    return RouterScope.of(context).firstObserverOfType<T>();
  }

  @visibleForTesting
  void popToRoot() => stackRouter.popUntilRoot();

  Future<void> pushByPath(String path) => stackRouter.pushNamed(path);

  Future<void> pop() => stackRouter.pop();

  // Future<void> popOrRoot() =>
  //     stackRouter.canPopSelfOrChildren ? pop() : pushRoot();

  void popUntilPath(String path) => stackRouter.popUntilRouteWithName(path);

  Future<void> push(PageRouteInfo<dynamic> route) => stackRouter.push(route);

  Future<void> replace(PageRouteInfo<dynamic> route) =>
      stackRouter.replace(route);

  Future<void> replacePath(String path) => stackRouter.replaceNamed(path);

  Future<void> pushAndClearStack(PageRouteInfo<dynamic> route) {
    return stackRouter.pushAndPopUntil(route, predicate: (_) => false);
  }
}

import 'package:crowdpad/dependency/get_it.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'navigation_service.dart';

void globalNavigateTo({required String route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .navigateTo(route, arguments: arguments);

void globalReplaceWith({required String route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .replaceWith(route, arguments: arguments);

void globalReplaceUntil(
        {required context, required route, dynamic arguments}) =>
    getItInstance<NavigationServiceImpl>()
        .replaceUntil(context: context, routeName: route, arguments: arguments);

void globalPop({required BuildContext context}) =>
    getItInstance<NavigationServiceImpl>().pop(context: context);

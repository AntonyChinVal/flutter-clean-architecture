import 'package:clean_project/src/presentation/core/ProviderScreen.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/appItemList/AppItemListNotifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'AppItemListTemplate.dart';

class AppItemListScreen extends StatefulScreen {
  static const String routeName = "AppItemList";

  @override
  String getName() {
    return "Home";
  }

  @override
  Icon getIcon() {
    return Icon(Icons.home);
  }

  @override
  AppItemListScreenState createState() => AppItemListScreenState();
}

class AppItemListScreenState
    extends ProviderScreenState<AppItemListNotifier, AppItemListScreen> {
  final TextEditingController _searchController = TextEditingController();

  AppItemListScreenState() : super(AppItemListNotifier());
  AppItemListScreenState.test(AppItemListNotifier notifier) : super(notifier);

  void getAppItems() {
    this.changeNotifier.getAppItems();
  }

  @override
  void afterInitState() {
    this.getAppItems();
    this._searchController.addListener(() {
      this.changeNotifier.filterAppItems(this._searchController.text);
    });
  }

  @override
  Widget buildTemplate() {
    return AppItemListTemplate(
      searchController: _searchController,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}

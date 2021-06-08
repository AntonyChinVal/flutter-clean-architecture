import 'package:clean_project/src/presentation/components/templates/AppItemListTemplate.dart';
import 'package:clean_project/src/presentation/core/Screen.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListBloc.dart';
import 'package:clean_project/src/presentation/screens/appItemList/bloc/AppItemListEvent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppItemListScreen extends Screen {
  static const String routeName = "AppItemList";
  AppItemListScreen({Key? key}) : super(key: key);

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
    extends ScreenState<AppItemListBloc, AppItemListScreen> {
  final TextEditingController _searchController = TextEditingController();

  AppItemListScreenState() : super(AppItemListBloc());
  AppItemListScreenState.test(AppItemListBloc? loginBloc) : super(loginBloc);

  void getAppItems() {
    this.bloc?.add(GetAppItemListEvent());
  }

  @override
  void afterInitState() {
    this.getAppItems();
    this._searchController.addListener(() {
      print(this._searchController.text);
      this.bloc?.add(FilterAppItemsEvent(this._searchController.text));
    });
  }

  @override
  Widget buildTemplate() {
    return AppItemListTemplate(
      items: this.bloc?.state.appItems,
      searchController: _searchController,
      inAsyncCall: this.bloc?.state.inAsyncCall,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }
}

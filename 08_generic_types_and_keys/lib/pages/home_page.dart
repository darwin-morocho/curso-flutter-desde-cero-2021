import 'package:flutter/material.dart';
import 'package:generic_types_and_keys/utils/countries.dart';
import 'package:generic_types_and_keys/utils/search_picker.dart';

class HomePage extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu_book_outlined),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
      ),
      drawer: Drawer(),
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              FlatButton(
                onPressed: () async {
                  final code = await showSearchPicker<int>(
                    context,
                    onItemBuild: (item) => ListTile(
                      title: Text(item.label),
                      subtitle: Text(item.value.toString()),
                    ),
                    onSearch: (e, query) {
                      if (e.value != null && e.value.toString().contains(query)) {
                        return true;
                      }
                      return e.label.toLowerCase().contains(query.toLowerCase());
                    },
                    items: countries
                        .map(
                          (e) => SearchPickerItem<int>(
                            label: e['country'],
                            value: e['calling_code'],
                          ),
                        )
                        .toList(),
                  );

                  print("✅ $code ");
                },
                child: Text("select country"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

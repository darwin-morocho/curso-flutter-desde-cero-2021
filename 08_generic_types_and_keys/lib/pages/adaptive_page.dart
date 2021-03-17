import 'package:flutter/material.dart';

class AdaptivePage extends StatelessWidget {
  final _listKey = GlobalKey();
  AdaptivePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: OrientationBuilder(builder: (_, Orientation orientiation) {
            if (orientiation == Orientation.portrait) {
              return AdpativeList(listKey: _listKey);
            }

            return Row(
              children: [
                Expanded(
                  child: Center(
                    child: Text("Left content"),
                  ),
                ),
                Expanded(
                  child: AdpativeList(listKey: _listKey),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}

class AdpativeList extends StatelessWidget {
  const AdpativeList({
    Key key,
    @required GlobalKey listKey,
  })  : _listKey = listKey,
        super(key: key);

  final GlobalKey _listKey;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      key: _listKey,
      itemBuilder: (_, index) => ListTile(
        title: Text("$index"),
      ),
      itemCount: 100,
    );
  }
}

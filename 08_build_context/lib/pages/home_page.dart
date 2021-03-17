import 'package:build_context/pages/widgets/random_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  final _textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   _getTextSize();
    // });
  }

  void onPressed() {
    final Size size = _getTextSize();
    print("🥶 before build text size $size");
    setState(() {
      counter++;
    });
    print("🥶 $counter");
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print("🥳 after build");
      final Size size = _getTextSize();
      print("🥶 text size $size");
    });
  }

  Size _getTextSize() {
    final RenderBox renderBox = _textKey.currentContext.findRenderObject();
    final Size size = renderBox.size;
    final Offset pos = renderBox.localToGlobal(Offset.zero);
    print("pos:::: $pos");
    final OverlayState overlayState = Overlay.of(context);
    final OverlayEntry entry = OverlayEntry(
      builder: (_) => Positioned(
        top: pos.dy + size.height,
        left: pos.dx,
        child: Material(
          child: Container(
            color: Colors.black,
            child: Text(
              "Floating view",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
    overlayState.insert(entry);
    Future.delayed(Duration(milliseconds: 500), () {
      entry.remove();
    });

    return size;
  }

  void _showSnackBar(BuildContext context) {
    final SnackBar snackBar = SnackBar(content: Text("hi"));
    Scaffold.of(context).showSnackBar(snackBar);
    Scaffold.of(context).openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "HOME PAGE $counter",
              key: _textKey,
            ),
            RandomText(
              onSizeChanged: (size) {
                print("size $size");
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Builder(
        builder: (_) => FloatingActionButton(
          onPressed: () => this._showSnackBar(_),
        ),
      ),
    );
  }
}

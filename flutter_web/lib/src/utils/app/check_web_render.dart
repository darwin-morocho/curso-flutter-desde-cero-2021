import "mock_dart_js.dart" if (dart.library.js) "dart:js" as js;

bool isHtmlRender() {
  final isHtml = js.context['flutterCanvasKit'] == null;
  print("isHtml $isHtml");
  return isHtml;
}

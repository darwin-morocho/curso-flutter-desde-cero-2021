import 'package:meta/meta.dart' show required;

class Category {
  final String iconPath, label;

  Category({
    @required this.iconPath,
    @required this.label,
  })  : assert(iconPath != null && iconPath.contains(".svg")),
        assert(label != null);
}

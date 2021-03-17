import 'package:meta/meta.dart' show required;

class OnboardItem {
  final String image, title, description;

  OnboardItem({
    @required this.image,
    @required this.title,
    @required this.description,
  })  : assert(image != null && image.contains(".svg")),
        assert(title != null),
        assert(description != null);
}

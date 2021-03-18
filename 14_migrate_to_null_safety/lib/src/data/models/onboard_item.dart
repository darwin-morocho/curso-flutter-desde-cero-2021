class OnboardItem {
  final String image, title, description;

  OnboardItem({
    required this.image,
    required this.title,
    required this.description,
  }) : assert(image.contains(".svg"));
}

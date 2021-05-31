class Category {
  final String iconPath, label;

  Category({
    required this.iconPath,
    required this.label,
  }) : assert(iconPath.contains(".svg"));
}

class Page {
  Page({
    required this.title,
    required this.options,
    required this.cardImage,
    this.imagePath = '',
    this.selectedOption = '',
  });

  String title, imagePath, cardImage, selectedOption;
  List<String> options;
}

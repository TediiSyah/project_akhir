class Scan {
  final int id;
  final String itemType;
  final String result;
  final double confidence;
  final String imagePath;

  Scan({
    required this.id,
    required this.itemType,
    required this.result,
    required this.confidence,
    required this.imagePath,
  });

  factory Scan.fromJson(Map<String, dynamic> json) {
    return Scan(
      id: json['id'],
      itemType: json['item_type'],
      result: json['result'],
      confidence: json['confidence'].toDouble(),
      imagePath: json['image_path'],
    );
  }
}
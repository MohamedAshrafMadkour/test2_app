class FavModel {
  final String productId;
  final String nationalId;

  FavModel({required this.productId, required this.nationalId});
  Map<String, String> toJson() {
    return {'productId': productId, 'nationalId': nationalId};
  }
}

import 'package:test2_app/core/helper/get_token.dart';

class IdModel {
  String? nationalId;
  final String productId;

  final String quantity;

  IdModel({
    required this.productId,
    required this.quantity,
  });
  Future<Map<String, String>> toJson() async {
    return {
      'nationalId': await getNationalId(),
      'productId': productId,
      'quantity': quantity,
    };
  }
}

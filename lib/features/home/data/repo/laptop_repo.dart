import 'package:dartz/dartz.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/data/models/profile_model.dart';

abstract class LaptopRepo {
  Future<Either<Failure, List<LaptopsModel>>> getProductData();
  Future<Either<Failure, Map<String, dynamic>>> postFav({required String id});
  Future<Either<Failure, List<LaptopsModel>>> getFav();
  Future<Either<Failure, Map<String, dynamic>>> postCart({
    required IdModel idModel,
  });
  Future<Either<Failure, List<CartModel>>> getCart();
  Future<Either<Failure, void>> deleteCart({required IdModel idModel});
  Future<Either<Failure, void>> updateCart({required IdModel idModel});
  Future<Either<Failure, Map<String, dynamic>>> deleteFav({
    required IdModel idModel,
  });
  Future<Either<Failure, ProfileModel>> getProfile();
}

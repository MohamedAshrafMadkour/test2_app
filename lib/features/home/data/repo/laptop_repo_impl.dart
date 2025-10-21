import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:test2_app/core/error/failure.dart';
import 'package:test2_app/core/helper/get_token.dart';
import 'package:test2_app/core/service/api_service.dart';
import 'package:test2_app/features/home/data/models/cart_model/cart_model.dart';
import 'package:test2_app/features/home/data/models/fav_model.dart';
import 'package:test2_app/features/home/data/models/id_model.dart';
import 'package:test2_app/features/home/data/models/laptops_model.dart';
import 'package:test2_app/features/home/data/models/profile_model.dart';
import 'package:test2_app/features/home/data/repo/laptop_repo.dart';

class HomeRepoImpl extends LaptopRepo {
  final ApiService apiService;

  HomeRepoImpl({required this.apiService});

  @override
  Future<Either<Failure, List<LaptopsModel>>> getProductData() async {
    try {
      final response = await apiService.get(
        'https://elwekala.onrender.com/product/Laptops',
      );
      final List<LaptopsModel> productList = [];
      for (var item in response['product']) {
        productList.add(LaptopsModel.fromJson(item));
      }
      return Right(productList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postFav({
    required String id,
  }) async {
    try {
      final FavModel fav = FavModel(
        productId: id,
        nationalId: await getNationalId(),
      );
      final data = await apiService.post(
        url: 'https://elwekala.onrender.com/favorite',
        data: fav.toJson(),
      );
      return Right(data);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<LaptopsModel>>> getFav() async {
    try {
      final response = await apiService.getFavAndCartAndProfile(
        'https://elwekala.onrender.com/favorite',
        {'nationalId': await getNationalId()},
      );
      final List<LaptopsModel> productList = [];
      for (var item in response['favoriteProducts']) {
        productList.add(LaptopsModel.fromJson(item));
      }

      log(productList.toString());
      return Right(productList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> postCart({
    required IdModel idModel,
  }) async {
    try {
      IdModel(
        productId: idModel.productId,
        quantity: idModel.quantity,
      );
      final res = await apiService.post(
        url: 'https://elwekala.onrender.com/cart/add',
        data: await idModel.toJson(),
      );
      return Right(res);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<CartModel>>> getCart() async {
    try {
      final response = await apiService.getFavAndCartAndProfile(
        'https://elwekala.onrender.com/cart/allProducts',
        {'nationalId': await getNationalId()},
      );
      log(response.toString());
      final List<CartModel> productList = [];
      for (var item in response['products']) {
        productList.add(CartModel.fromJson(item));
      }
      return right(productList);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteCart({required IdModel idModel}) async {
    try {
      await apiService.delete(
        url: 'https://elwekala.onrender.com/cart/delete',
        data: await idModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateCart({required IdModel idModel}) async {
    try {
      await apiService.put(
        url: 'https://elwekala.onrender.com/cart',
        data: await idModel.toJson(),
      );
      return const Right(null);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> deleteFav({
    required IdModel idModel,
  }) async {
    try {
      final res = await apiService.delete(
        url: 'https://elwekala.onrender.com/favorite',
        data: await idModel.toJson(),
      );
      return Right(res);
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, ProfileModel>> getProfile() async {
    try {
      final response = await apiService.post(
        url: 'https://elwekala.onrender.com/user/profile',
        data: {'token': await getToken()},
      );
      log(response.toString());
      return Right(ProfileModel.fromJson(response['user']));
    } catch (e) {
      return Left(ServerFailure(errorMessage: e.toString()));
    }
  }
}

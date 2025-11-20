import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../entities/area_entity.dart';
import '../entities/city_entity.dart';

abstract class CityRepo {
  Future<Either<DioException, List<CityEntity>>> getCities();
  Future<Either<DioException, List<AreaEntity>>> getArea(Map<String,dynamic> data);
}
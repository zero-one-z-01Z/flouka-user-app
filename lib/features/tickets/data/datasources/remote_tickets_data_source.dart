import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../../core/helper_function/api.dart';
import '../models/ticket_message_model.dart';
import '../models/ticket_model.dart';


class RemoteTicketsDataSource {

  final ApiHandel apiHandel;
  RemoteTicketsDataSource(this.apiHandel);

  Future<Either<DioException, List<TicketModel>>> getTickets(
      Map<String, dynamic> data) async {
    var response =  await apiHandel.get('get_tickets', data);

    return response.fold((l) {
      return Left(l);}, (r) {
      List<TicketModel> list = [];
      for (var i in r.data['data']) {
        list.add(TicketModel.fromJson(i));
      }
      return Right(list);
    });
  }

  Future<Either<DioException, TicketModel>> createTicket(Map<String, dynamic> data) async {
    var response =  await apiHandel.post('create_ticket', data);
    return response.fold((l) {
      return Left(l);}, (r) {
      return Right(TicketModel.fromJson(r.data['data']));
    });
  }


  Future<Either<DioException, TicketModel>> getTicketDetails(Map<String, dynamic> data) async {
    var response =  await apiHandel.post('get_ticket_details', data);
    return response.fold((l) {
      return Left(l);}, (r) {
      return Right(TicketModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, TicketMessageModel>> createTicketMessage(Map<String, dynamic> data) async {
    var response =  await apiHandel.post('create_ticket_message', data);
    return response.fold((l) {
      return Left(l);}, (r) {
      return Right(TicketMessageModel.fromJson(r.data['data']));
    });
  }

  Future<Either<DioException, List<TicketProblemCategoryModel>>> getTicketCategory(
      Map<String, dynamic> data) async {
    var response =  await apiHandel.get('get_ticket_category', data);

    return response.fold((l) {
      return Left(l);}, (r) {
      List<TicketProblemCategoryModel> list = [];
      for (var i in r.data['data']) {
        list.add(TicketProblemCategoryModel.fromJson(i));
      }
      return Right(list);
    });
  }


}

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/pagination_class.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/usecases/tickets_use_case.dart';
import '../pages/tickets_page.dart';

class TicketsProvider extends ChangeNotifier implements PaginationClass {
  List<TicketEntity>? tickets;
  ScrollController scrollController = ScrollController();
  final TicketsUseCase ticketsUseCase;
  TicketsProvider(this.ticketsUseCase);

  @override
  int pageIndex = 1;
  void clear() {
    tickets = null;
    paginationStarted = false;
    paginationFinished = false;
    pageIndex = 1;
  }

  void goToTicketsPage() {
    refresh();
    navP(const TicketsPage());
  }

  Future getTickets() async {
    Map<String, dynamic> data = {};
    data['page'] = pageIndex;
    Either<DioException, List<TicketEntity>> value = await ticketsUseCase
        .getTickets(data);
    value.fold(
      (l) {
        showToast(l.message ?? "");
      },
      (r) async {
        pageIndex++;
        tickets ??= [];
        tickets?.addAll(r);
        notifyListeners();
        if (r.isEmpty) {
          paginationFinished = true;
        }
      },
    );
    paginationStarted = false;
    notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }

  void refresh() {
    clear();
    getTickets();
  }

  void updateTicketStatus(TicketEntity ticket) {
    int index = tickets!.indexWhere((element) => element.id == ticket.id);
    if (index != -1) {
      tickets![index] = ticket;
    }
    notifyListeners();
  }

  @override
  bool paginationFinished = false;

  @override
  bool paginationStarted = false;

  @override
  void pagination() {
    scrollController.addListener(() async {
      if (scrollController.position.atEdge &&
          scrollController.position.pixels > 50) {
        if (!paginationFinished &&
            !paginationStarted &&
            tickets != null &&
            tickets!.isNotEmpty) {
          paginationStarted = true;
          notifyListeners();
          await getTickets();
        }
      }
    });
  }
}

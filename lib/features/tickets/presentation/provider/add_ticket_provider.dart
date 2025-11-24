import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/dialog/drop_down_dialog.dart';
import '../../../../core/dialog/snack_bar.dart';
import '../../../../core/dialog/success_dialog.dart';
import '../../../../core/helper_function/loading.dart';
import '../../../../core/helper_function/navigation.dart';
import '../../../../core/models/text_field_model.dart';
import '../../domain/entities/ticket_entity.dart';
import '../../domain/usecases/tickets_use_case.dart';
import '../pages/add_ticket_page.dart';
import 'important_ticket_values_provider.dart';
import 'tickets_category_provider.dart';
import 'tickets_provider.dart';

class AddTicketProvider extends ChangeNotifier {
  List<TextFieldModel> ticketInputs = [];
  final TicketsUseCase ticketsUseCase;
  AddTicketProvider(this.ticketsUseCase);

  void goToAddTicketPage() {
    TicketsCategoryProvider ticketsCategoryCubit = Provider.of(
      Constants.globalContext(),
      listen: false,
    );
    ticketsCategoryCubit.getCategories();
    ticketInputs = [
      TextFieldModel(
        key: "ticket_category_id",
        controller: TextEditingController(),
        textInputType: TextInputType.phone,
        // validator: (value) => validateProblem(value),
        onTap: () {
          TicketsCategoryProvider ticketsCategoryProvider = Provider.of(
            Constants.globalContext(),
            listen: false,
          );
          showDropDownDialog(ticketsCategoryProvider);
        },
        label: "problem_type",
        readOnly: true,
        suffix: const Icon(Icons.arrow_drop_down_sharp, size: 30),
        next: true,
      ),
      TextFieldModel(
        key: "important",
        controller: TextEditingController(),
        textInputType: TextInputType.phone,
        // validator: (value) => validateEnterImportant(value),
        onTap: () {
          ImportantTicketValuesProvider importantTicketValuesProvider =
              Provider.of(Constants.globalContext(), listen: false);
          showDropDownDialog(importantTicketValuesProvider);
        },
        label: "important",
        readOnly: true,
        next: true,
        suffix: const Icon(Icons.arrow_drop_down_sharp, size: 30),
      ),
      TextFieldModel(
        key: "reason_id",
        controller: TextEditingController(),
        textInputType: TextInputType.number,
        validator: (value) => null,
        label: "reason_id",
        next: true,
      ),
      TextFieldModel(
        key: "title",
        controller: TextEditingController(),
        textInputType: TextInputType.text,
        // validator: (value) => validateTitle(value),
        label: "title",
        next: true,
      ),
      TextFieldModel(
        key: "description",
        controller: TextEditingController(),
        label: "description",
        max: 5,
        // validator: (value) => validateDescription(value),
        next: false,
      ),
    ];
    navP(AddTicketPage());
  }

  Future createTicket() async {
    Map<String, dynamic> data = {};
    loading();
    for (var element in ticketInputs) {
      if (element.key == "ticket_category_id") {
        TicketsCategoryProvider ticketsCategoryProvider = Provider.of(
          Constants.globalContext(),
          listen: false,
        );
        data['ticket_category_id'] =
            ticketsCategoryProvider.problemCategory?.id;
      } else if (element.key == "important") {
        ImportantTicketValuesProvider importantTicketValuesProvider =
            Provider.of(Constants.globalContext(), listen: false);
        data['${element.key}'] = importantTicketValuesProvider.important;
      } else {
        if (element.controller.text.isNotEmpty) {
          data['${element.key}'] = element.controller.text;
        }
      }
    }
    Either<DioException, TicketEntity> value = await ticketsUseCase
        .createTicket(data);
    navPop();
    value.fold(
      (l) {
        showToast(l.message ?? "");
      },
      (r) async {
        TicketsProvider ticketsProvider = Provider.of(
          Constants.globalContext(),
          listen: false,
        );
        ticketsProvider.tickets?.insert(0, r);
        ticketsProvider.rebuild();
        successDialog(
          then: () {
            for (var element in ticketInputs) {
              element.controller.clear();
            }
            navPop();
          },
        );
        notifyListeners();
      },
    );
  }
}

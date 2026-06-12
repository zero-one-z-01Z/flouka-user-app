import 'package:equatable/equatable.dart';

class AreaEntity extends Equatable{
  int id;
  int cityId;
  String name;
  AreaEntity({
    required this.id,
    required this.name,
    required this.cityId,
  });

  @override
  List<Object?> get props => [id,cityId,name];
}

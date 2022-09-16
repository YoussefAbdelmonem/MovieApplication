import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  int statusCode;
  bool success;
  String statusMessage;

  ErrorMessageModel(
      {required this.statusCode,
      required this.success,
      required this.statusMessage});

  factory ErrorMessageModel.fromJson(Map<String, dynamic> json) =>
      ErrorMessageModel(
          statusCode: json["status_code"],
          success: json["success"],
          statusMessage: json["status_message"]);

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode ,success, statusMessage];
  
}

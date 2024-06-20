import 'base_model.dart';

class SuccessResponse extends BaseModel<SuccessResponse> {
  late bool status;
  String? errorMessage;

  @override
  SuccessResponse fromJson(Map<String, dynamic> json) {
    status = json['Status'] as bool;
    errorMessage = json['ErrorMessage'] as String?;
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
        'Status': status,
        'ErrorMessage': errorMessage,
      };
}

import 'package:network/models/base_model.dart';

class UserView extends BaseModel<UserView> {
  Data? data;
  Support? support;

  UserView({this.data, this.support});

  @override
  UserView fromJson(Map<String, dynamic> json) {
    data = Data.fromJson(json['data']);
    support = Support.fromJson(json['support']);
    return this;
  }

  @override
  Map<String, dynamic> toJson() => {
        'data': data?.toJson(),
        'support': support?.toJson(),
      };
}

class Data {
  int id;
  String email;
  String firstName;
  String lastName;
  String avatar;

  Data({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      email: json['email'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'first_name': firstName,
      'last_name': lastName,
      'avatar': avatar,
    };
  }
}

class Support {
  String url;
  String text;

  Support({
    required this.url,
    required this.text,
  });

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'url': url,
      'text': text,
    };
  }
}

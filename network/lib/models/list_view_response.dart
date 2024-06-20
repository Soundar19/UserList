
import 'base_model.dart';

class User extends BaseModel<User> {
   int? id;
   String? email;
   String? firstName;
   String? lastName;
   String? avatar;



   @override
   User fromJson(Map<String, dynamic> json) {
     id= json['id'];
     email= json['email'];
     firstName= json['first_name'];
     lastName= json['last_name'];
     avatar=json['avatar'];
     return this;
   }



  @override
  Map<String, dynamic> toJson() {
    // TODO: implement toJson
    throw UnimplementedError();
  }
}

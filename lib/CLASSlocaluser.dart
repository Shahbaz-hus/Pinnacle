//name of device owner
class User{  
  String name;
  int avatar;

  User({this.avatar,this.name});
  Map<String, dynamic> toMap(){
    return{'avatar': avatar, 'name': name};
  }
  
}
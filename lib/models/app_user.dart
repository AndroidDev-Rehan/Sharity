//TODO change the fields
class AppUser{
  final String userName;
  final String imgUrl;
  final String uid;
  final String userToken;

  AppUser({this.userName, this.imgUrl, this.uid,this.userToken});

  Map<String,String> toMap(){
    return {
      'userName' : userName,
      'imgUrl'   : imgUrl,
      'uid'      : uid,
      'userToken': userToken,
    };
  }

  factory AppUser.fromMap(Map<String,dynamic> map){
    return AppUser(userName: map['userName'], imgUrl: map['imgUrl'], uid: map['uid'], userToken: map['userToken']);
  }

}
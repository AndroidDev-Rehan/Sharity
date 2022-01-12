class CharityModel {

  CharityModel({this.description,this.ethAddress,this.imageUrl,this.name,this.cid});

  final String ethAddress;
  final String name;
  final description;
  final String imageUrl;
  String cid;

  factory CharityModel.fromMap (Map<String,dynamic> map){
    return CharityModel(
      ethAddress: map["ethAddress"],
      name: map['name'],
      description: map["description"],
      imageUrl: map["imageUrl"],
      cid : map['cid']
    );
  }

  Map<String,dynamic> toMap() {
    return {
      "name" : name,
      "ethAddress" : ethAddress,
      "description" : description,
      "imageUrl" : imageUrl,
      'cid' : cid
    };
  }

}
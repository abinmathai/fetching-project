





class Album{
   int? postid;
   int? id;
   String? name;
   String? email;
  String? body;

     Album ({

    required this.postid,
    required this.id,
    required this.name,
    required this.email,
    required this.body,
  });
   factory Album.fromjason(Map<String,dynamic> json){

return Album(

  postid:json['postid'],
  id:json['id'],
  name:json['name'],
  email:json['email'],
  body:json['body'],
);
   }
   
}
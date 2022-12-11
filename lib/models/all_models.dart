// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';


class Room {
  int id;
  List<User> participants;
  User host;
  Topic topic;
  String name;
  String description;
  String createdAt;
  String updatedAt;

  Room({
    required this.id,
    required this.participants,
    required this.host,
    required this.topic,
    required this.name,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'participants': participants.map((x) => x.toMap()).toList(),
      'host': host.toMap(),
      'topic': topic.toMap(),
      'name': name,
      'description': description,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Room.fromMap(Map<String, dynamic> map) {
    return Room(
      id: map['id'] as int,
      participants: List<User>.from((map['participants'] as List<dynamic>).map<User>((x) => User.fromMap(x as Map<String,dynamic>),),),
      host: User.fromMap(map['host'] as Map<String,dynamic>),
      topic: Topic.fromMap(map['topic'] as Map<String,dynamic>),
      name: map['name'] as String,
      description: map['description'] as String,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Room.fromJson(String source) => Room.fromMap(json.decode(source) as Map<String, dynamic>);
}

class User {
  int id;
  String username;
  String avatar;
  String? token;

  User({
    required this.id,
    required this.username,
    required this.avatar,
    this.token,
  });

  User copyWith({
    int? id,
    String? username,
    String? avatar,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      avatar: avatar ?? this.avatar,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'avatar': avatar,
      'token': token,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as int,
      username: map['username'] as String,
      avatar: map['avatar'] as String,
      token: map['token'] != null ? map['token'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'User(id: $id, username: $username, avatar: $avatar, token: $token)';
  }

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.username == username &&
      other.avatar == avatar &&
      other.token == token;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      username.hashCode ^
      avatar.hashCode ^
      token.hashCode;
  }
}

class Topic {
  int id;
  String name;

  Topic({
    required this.id,
    required this.name,
  });


  Topic copyWith({
    int? id,
    String? name,
  }) {
    return Topic(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory Topic.fromMap(Map<String, dynamic> map) {
    return Topic(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Topic.fromJson(String source) => Topic.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Topic(id: $id, name: $name)';

  @override
  bool operator ==(covariant Topic other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

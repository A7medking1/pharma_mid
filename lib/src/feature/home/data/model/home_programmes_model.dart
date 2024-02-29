import 'dart:convert';

import 'package:equatable/equatable.dart';

/*class HomeProgrammesModel extends Equatable {
  final Data data;

  const HomeProgrammesModel({
    required this.data,
  });

  factory HomeProgrammesModel.fromJson(Map<String, dynamic> json) {
    return HomeProgrammesModel(
      data: Data.fromJson(json['data'][0]),
    );
  }

  @override
  List<Object> get props => [ data];
}*/

/*
class ProgrammesModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final List<Subcategories> subcategories;

  const ProgrammesModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.subcategories,
  });

  factory ProgrammesModel.fromJson(Map<String, dynamic> json) {
    return ProgrammesModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      subcategories: List<Subcategories>.from(
        (json["subcategories"]).map(
          (e) => Subcategories.fromJson(e),
        ),
      ),
    );
  }

  @override
  List<Object> get props => [id, name, slug, subcategories];
//
}

class Subcategories extends Equatable {
  final int id;
  final String name;
  final String slug;
  final List<Posts> posts;

  const Subcategories({
    required this.id,
    required this.name,
    required this.slug,
    required this.posts,
  });

  factory Subcategories.fromJson(Map<String, dynamic> json) {
    return Subcategories(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      posts: List<Posts>.from(
        (json["programs"]).map(
          (e) => Posts.fromJson(e),
        ),
      ),
    );
  }

  @override
  List<Object> get props => [id, name, slug, posts];
//
}

class Posts extends Equatable {
  final int id;
  final String title;
  final String image;
  final String content;
  final CustomField customField;
  final bool? favorite_status;
  final String? custom_field_video;

  const Posts({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.customField,
    this.favorite_status,
    this.custom_field_video,
  });

  factory Posts.fromJson(Map<String, dynamic> json) {
    return Posts(
      id: (json["id"]),
      title: json["title"],
      image: json["image"],
      content: json["content"],
      favorite_status: json["favorite_status"] ?? false,
      custom_field_video: json["custom_field_video"],
      customField: CustomField.fromJson(json["custom_field"]),
    );
  }



  factory Posts.fromNotification(Map<String, dynamic> json) {
    return Posts(
      id: (json["id"]),
      title: json["title"],
      image: json["image"],
      content: json["content"],
      favorite_status: json["favorite_status"] ?? false,
      custom_field_video: json["custom_field_video"],
      customField: CustomField.fromNotification(json["custom_field"]),
    );
  }




  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "image": image,
      "content": content,
      "custom_field": customField.toJson(),
      "favorite_status": favorite_status,
      "custom_field_video": custom_field_video,
    };
  }

  @override
  List<Object> get props => [id, title, image, content, customField];
}

class CustomField extends Equatable {
  final String pageCaption;
  final String session_date;
  final String session_time;
  final String document_link;
  final String session_type;
  final String location;
  final List<String> sessionSpeaker;


  const CustomField({
    required this.pageCaption,
    required this.session_date,
    required this.session_time,
    required this.document_link,
    required this.session_type,
    required this.location,
    required this.sessionSpeaker,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    return CustomField(
      pageCaption: json["page-caption"],
      session_date: json["session-date"],
      session_time: json["session-time"],
      document_link: json["document-link"],
      session_type: json["session-type"],
      sessionSpeaker: json['session-speaker'].cast<String>(),
      location: json["location"],
    );
  }

  factory CustomField.fromNotification(Map<String, dynamic> json) {
    return CustomField(
      pageCaption: json["page-caption"],
      session_date: json["session-date"],
      session_time: json["session-time"],
      document_link: json["document-link"],
      session_type: json["session-type"],
      sessionSpeaker: json['session-speaker'].cast<String>(),
      location: json["location"],
    );
  }




  Map<String, dynamic> toJson() {
    return {
      "page-caption": pageCaption,
      "session-date": session_date,
      "session-time": session_time,
      "document-link": document_link,
      "session-type": session_type,
      "location": location,
      "session-speaker": sessionSpeaker,
    };
  }

  @override
  List<Object> get props => [
        pageCaption,
        session_date,
        session_time,
        document_link,
        session_type,
        location,
        sessionSpeaker,
      ];
}
*/

/*
class sessionSpeaker extends Equatable {

 final String speaker;

 const sessionSpeaker(this.speaker);
}
*/

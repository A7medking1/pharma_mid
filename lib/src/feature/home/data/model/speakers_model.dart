import 'package:equatable/equatable.dart';

class SpeakersModel extends Equatable {
  final int id;
  final String name;
  final String slug;
  final List<Subcategories> subcategories;

  const SpeakersModel({
    required this.id,
    required this.name,
    required this.slug,
    required this.subcategories,
  });

  factory SpeakersModel.fromJson(Map<String, dynamic> json) {
    return SpeakersModel(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      subcategories: List<Subcategories>.from(
        (json["subcategories"]).map((e) => Subcategories.fromJson(e)),
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
  final List<Speakers> speakers;

  const Subcategories({
    required this.id,
    required this.name,
    required this.slug,
    required this.speakers,
  });

  factory Subcategories.fromJson(Map<String, dynamic> json) {
    return Subcategories(
      id: json["id"],
      name: json["name"],
      slug: json["slug"],
      speakers: List<Speakers>.from(
        (json["speakers"] ?? json["programs"]).map((e) => Speakers.fromJson(e)),
      ),
    );
  }

  @override
  List<Object> get props => [id, name, slug, speakers];
//
}

class Speakers extends Equatable {
  final int id;
  final String title;
  final String image;
  final String content;
  final CustomField customField;

  const Speakers({
    required this.id,
    required this.title,
    required this.image,
    required this.content,
    required this.customField,
  });

  factory Speakers.fromJson(Map<String, dynamic> json) {
    return Speakers(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      content: json["content"],
      customField: CustomField.fromJson(json["custom_field"]),
    );
  }

  @override
  List<Object> get props => [id, title, image, content, customField];
//
}

class CustomField extends Equatable {
  final String pageCaption;
  final String speakerSocial;
  final String telephone;
  final String email;
  final String website;
  final String icon1;
  final String iconLink1;
  final String icon2;
  final String iconLink2;
  final String icon3;
  final String iconLink3;

  const CustomField({
    required this.pageCaption,
    required this.speakerSocial,
    required this.telephone,
    required this.email,
    required this.website,
    required this.icon1,
    required this.iconLink1,
    required this.icon2,
    required this.iconLink2,
    required this.icon3,
    required this.iconLink3,
  });

  factory CustomField.fromJson(Map<String, dynamic> json) {
    return CustomField(
      pageCaption: json["page-caption"],
      speakerSocial: json["speaker-social"],
      telephone: json["telephone"],
      email: json["email"],
      website: json["website"],
      icon1: json["icon-1"],
      iconLink1: json["icon-link-1"],
      icon2: json["icon-2"],
      iconLink2: json["icon-link-2"],
      icon3: json["icon-3"],
      iconLink3: json["icon-link-3"],
    );
  }

  @override
  List<Object> get props => [
        pageCaption,
        speakerSocial,
        telephone,
        email,
        website,
        icon1,
        iconLink1,
        icon2,
        iconLink2,
        icon3,
        iconLink3,
      ];
//
}

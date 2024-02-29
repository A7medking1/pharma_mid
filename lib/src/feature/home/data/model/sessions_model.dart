class HomeSessionsModel {
  int? id;
  String? name;
  String? slug;
  List<HomeSubcategories>? subcategories;

  HomeSessionsModel({this.id, this.name, this.slug, this.subcategories});

  HomeSessionsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['subcategories'] != null) {
      subcategories = <HomeSubcategories>[];
      json['subcategories'].forEach((v) {
        subcategories!.add(HomeSubcategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (subcategories != null) {
      data['subcategories'] = subcategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HomeSubcategories {
  int? id;
  String? name;
  String? slug;
  List<HomePrograms>? programs;
  Pagination? pagination;

  HomeSubcategories(
      {this.id, this.name, this.slug, this.programs, this.pagination});

  HomeSubcategories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    if (json['programs'] != null) {
      programs = <HomePrograms>[];
      json['programs'].forEach((v) {
        programs!.add(HomePrograms.fromJson(v));
      });
    }
    pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['slug'] = slug;
    if (programs != null) {
      data['programs'] = programs!.map((v) => v.toJson()).toList();
    }
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    return data;
  }
}

class HomePrograms {
  int? id;
  String? title;
  String? image;
  String? content;
  HomeCustomField? customField;
  String? customFieldVideo;
  bool? favoriteStatus;

  HomePrograms({
    this.id,
    this.title,
    this.image,
    this.content,
    this.customField,
    this.customFieldVideo,
    this.favoriteStatus,
  });

  HomePrograms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    content = json['content'];
    customField = json['custom_field'] != null
        ? HomeCustomField.fromJson(json['custom_field'])
        : null;
    customFieldVideo = json['custom_field_video'];
    favoriteStatus = json['favorite_status'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['image'] = image;
    data['content'] = content;
    if (customField != null) {
      data['custom_field'] = customField!.toJson();
    }
    data['custom_field_video'] = customFieldVideo;
    data['favorite_status'] = favoriteStatus;
    return data;
  }
}

class HomeCustomField {
  String? pageCaption;
  String? sessionType;
  List<String>? sessionSpeaker;
  String? sessionDate;
  String? sessionTime;
  String? location;
  String? documentLink;

  HomeCustomField(
      {this.pageCaption,
      this.sessionType,
      this.sessionSpeaker,
      this.sessionDate,
      this.sessionTime,
      this.location,
      this.documentLink});

  HomeCustomField.fromJson(Map<String, dynamic> json) {
    pageCaption = json['page-caption'];
    sessionType = json['session-type'];
    sessionSpeaker = json['session-speaker'].cast<String>();
    sessionDate = json['session-date'];
    sessionTime = json['session-time'];
    location = json['location'];
    documentLink = json['document-link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['page-caption'] = pageCaption;
    data['session-type'] = sessionType;
    data['session-speaker'] = sessionSpeaker;
    data['session-date'] = sessionDate;
    data['session-time'] = sessionTime;
    data['location'] = location;
    data['document-link'] = documentLink;
    return data;
  }
}

class Pagination {
  int? currentPage;
  int? totalPages;

  Pagination({this.currentPage, this.totalPages});

  Pagination.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    totalPages = json['total_pages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['current_page'] = currentPage;
    data['total_pages'] = totalPages;
    return data;
  }
}

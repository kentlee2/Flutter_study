class OnlineMovie {
  int count;
  int start;
  int total;
  List<Subject> subjects;

  OnlineMovie({
    this.count,
    this.start,
    this.total,
    this.subjects,
  });

  factory OnlineMovie.fromJson(Map<String, dynamic> json) {
    var list = json['subjects'] as List;
    List<Subject> subjectList = list.map((i) => Subject.fromJson(i)).toList();
    return OnlineMovie(
        count: json['count'],
        start: json['start'],
        total: json['total'],
        subjects: subjectList);
  }
}

class Subject {
  RateData rating;
  List<String> genres;
  String title;
  List<People> casts;
  int collect_count;
  String mainland_pubdate;
  bool has_video;
  List<People> directors;
  String year;
  Images images;
  String alt;
  String id;

  Subject(
      {this.rating,
      this.genres,
      this.title,
      this.casts,
      this.collect_count,
      this.mainland_pubdate,
      this.has_video,
      this.directors,
      this.year,
      this.images,
      this.alt,
      this.id});

  factory Subject.fromJson(Map<String, dynamic> json) {
    var genresJson = json['genres'];
    List<String> genresList = new List<String>.from(genresJson);
    var castsJsonList = json['casts'] as List;
    List<People> castsList =
        castsJsonList.map((i) => People.fromJson(i)).toList();
    var directorsJson = json['directors'] as List;
    List<People> directorsList =
        directorsJson.map((i) => People.fromJson(i)).toList();
    var images = Images.fromJson(json['images']);

    return Subject(
        rating: RateData.fromJson(json['rating']),
        genres: genresList,
        title: json['title'],
        casts: castsList,
        collect_count: json['collect_count'],
        mainland_pubdate: json['mainland_pubdate'],
        has_video: json['has_video'],
        directors: directorsList,
        year: json['year'],
        images: images,
        alt: json['alt'],
        id: json['id']);
  }
}

class RateData {
  int max;
  String average;
  String stars;
  int min;

  RateData({this.max, this.average, this.stars, this.min});

  factory RateData.fromJson(Map<String, dynamic> json) {
    return RateData(
        max: json['max'],
        average: json['average'].toString(),
        stars: json['stars'],
        min: json['min']);
  }
}

class People {
  Images avatars;
  String name_en;
  String name;
  String alt;
  String id;

  People({this.avatars, this.name_en, this.name, this.alt, this.id});

  factory People.fromJson(Map<String, dynamic> json) {
    var avatar = Images.fromJson(json['avatars']);
    return People(
      avatars: avatar,
      name: json['name'],
      name_en: json['name_en'],
      alt: json['alt'],
      id: json['id'],
    );
  }
}

class Images {
  String small;
  String large;
  String medium;

  Images({this.small, this.large, this.medium});

  factory Images.fromJson(Map<String, dynamic> json) {
    return Images(
        small: json['small'], large: json['large'], medium: json['medium']);
  }
}

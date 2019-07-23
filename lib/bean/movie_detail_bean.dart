class MovieDetailBean {
  bool hasSchedule;
  String year;
  List<MovieDetailBeanClip> clips;
  List<String> clipUrls;
  dynamic currentSeason;
  MovieDetailBeanRating rating;
  List<Null> videos;
  String scheduleUrl;
  List<MovieDetailBeanPhoto> photos;
  List<String> pubdates;
  bool hasTicket;
  List<String> durations;
  String id;
  int ratingsCount;
  int photosCount;
  List<MovieDetailBeanPopularReview> popularReviews;
  MovieDetailBeanImages images;
  List<String> blooperUrls;
  String alt;
  dynamic collection;
  List<String> countries;
  List<MovieDetailBeanBlooper> bloopers;
  List<String> tags;
  List<MovieDetailBeanTrailer> trailers;
  List<MovieDetailBeanPopularCommants> popularComments;
  List<MovieDetailBeanCast> casts;
  dynamic seasonsCount;
  String shareUrl;
  int commentsCount;
  int reviewsCount;
  List<MovieDetailBeanDirector> directors;
  String doubanSite;
  String mobileUrl;
  String title;
  bool hasVideo;
  String subtype;
  List<String> genres;
  dynamic doCount;
  int wishCount;
  String pubdate;
  String summary;
  String website;
  String originalTitle;
  List<String> languages;
  List<MovieDetailBeanWriter> writers;
  int collectCount;
  dynamic episodesCount;
  List<String> aka;
  List<String> trailerUrls;
  String mainlandPubdate;

  MovieDetailBean(
      {this.hasSchedule,
      this.year,
      this.clips,
      this.clipUrls,
      this.currentSeason,
      this.rating,
      this.videos,
      this.scheduleUrl,
      this.photos,
      this.pubdates,
      this.hasTicket,
      this.durations,
      this.id,
      this.ratingsCount,
      this.photosCount,
      this.popularReviews,
      this.images,
      this.blooperUrls,
      this.alt,
      this.collection,
      this.countries,
      this.bloopers,
      this.tags,
      this.trailers,
      this.popularComments,
      this.casts,
      this.seasonsCount,
      this.shareUrl,
      this.commentsCount,
      this.reviewsCount,
      this.directors,
      this.doubanSite,
      this.mobileUrl,
      this.title,
      this.hasVideo,
      this.subtype,
      this.genres,
      this.doCount,
      this.wishCount,
      this.pubdate,
      this.summary,
      this.website,
      this.originalTitle,
      this.languages,
      this.writers,
      this.collectCount,
      this.episodesCount,
      this.aka,
      this.trailerUrls,
      this.mainlandPubdate});

  MovieDetailBean.fromJson(Map<String, dynamic> json) {
    hasSchedule = json['has_schedule'];
    year = json['year'];
    if (json['clips'] != null) {
      clips = new List<MovieDetailBeanClip>();
      (json['clips'] as List).forEach((v) {
        clips.add(new MovieDetailBeanClip.fromJson(v));
      });
    }
    clipUrls = json['clip_urls']?.cast<String>();
    currentSeason = json['current_season'];
    rating = json['rating'] != null
        ? new MovieDetailBeanRating.fromJson(json['rating'])
        : null;
    if (json['videos'] != null) {
      videos = new List<Null>();
    }
    scheduleUrl = json['schedule_url'];
    if (json['photos'] != null) {
      photos = new List<MovieDetailBeanPhoto>();
      (json['photos'] as List).forEach((v) {
        photos.add(new MovieDetailBeanPhoto.fromJson(v));
      });
    }
    pubdates = json['pubdates']?.cast<String>();
    hasTicket = json['has_ticket'];
    durations = json['durations']?.cast<String>();
    id = json['id'];
    ratingsCount = json['ratings_count'];
    photosCount = json['photos_count'];
    if (json['popular_reviews'] != null) {
      popularReviews = new List<MovieDetailBeanPopularReview>();
      (json['popular_reviews'] as List).forEach((v) {
        popularReviews.add(new MovieDetailBeanPopularReview.fromJson(v));
      });
    }
    images = json['images'] != null
        ? new MovieDetailBeanImages.fromJson(json['images'])
        : null;
    blooperUrls = json['blooper_urls']?.cast<String>();
    alt = json['alt'];
    collection = json['collection'];
    countries = json['countries']?.cast<String>();
    if (json['bloopers'] != null) {
      bloopers = new List<MovieDetailBeanBlooper>();
      (json['bloopers'] as List).forEach((v) {
        bloopers.add(new MovieDetailBeanBlooper.fromJson(v));
      });
    }
    tags = json['tags']?.cast<String>();
    if (json['trailers'] != null) {
      trailers = new List<MovieDetailBeanTrailer>();
      (json['trailers'] as List).forEach((v) {
        trailers.add(new MovieDetailBeanTrailer.fromJson(v));
      });
    }
    if (json['popular_comments'] != null) {
      popularComments = new List<MovieDetailBeanPopularCommants>();
      (json['popular_comments'] as List).forEach((v) {
        popularComments.add(new MovieDetailBeanPopularCommants.fromJson(v));
      });
    }
    if (json['casts'] != null) {
      casts = new List<MovieDetailBeanCast>();
      (json['casts'] as List).forEach((v) {
        casts.add(new MovieDetailBeanCast.fromJson(v));
      });
    }
    seasonsCount = json['seasons_count'];
    shareUrl = json['share_url'];
    commentsCount = json['comments_count'];
    reviewsCount = json['reviews_count'];
    if (json['directors'] != null) {
      directors = new List<MovieDetailBeanDirector>();
      (json['directors'] as List).forEach((v) {
        directors.add(new MovieDetailBeanDirector.fromJson(v));
      });
    }
    doubanSite = json['douban_site'];
    mobileUrl = json['mobile_url'];
    title = json['title'];
    hasVideo = json['has_video'];
    subtype = json['subtype'];
    genres = json['genres']?.cast<String>();
    doCount = json['do_count'];
    wishCount = json['wish_count'];
    pubdate = json['pubdate'];
    summary = json['summary'];
    website = json['website'];
    originalTitle = json['original_title'];
    languages = json['languages']?.cast<String>();
    if (json['writers'] != null) {
      writers = new List<MovieDetailBeanWriter>();
      (json['writers'] as List).forEach((v) {
        writers.add(new MovieDetailBeanWriter.fromJson(v));
      });
    }
    collectCount = json['collect_count'];
    episodesCount = json['episodes_count'];
    aka = json['aka']?.cast<String>();
    trailerUrls = json['trailer_urls']?.cast<String>();
    mainlandPubdate = json['mainland_pubdate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['has_schedule'] = this.hasSchedule;
    data['year'] = this.year;
    if (this.clips != null) {
      data['clips'] = this.clips.map((v) => v.toJson()).toList();
    }
    data['clip_urls'] = this.clipUrls;
    data['current_season'] = this.currentSeason;
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    if (this.videos != null) {
      data['videos'] = [];
    }
    data['schedule_url'] = this.scheduleUrl;
    if (this.photos != null) {
      data['photos'] = this.photos.map((v) => v.toJson()).toList();
    }
    data['pubdates'] = this.pubdates;
    data['has_ticket'] = this.hasTicket;
    data['durations'] = this.durations;
    data['id'] = this.id;
    data['ratings_count'] = this.ratingsCount;
    data['photos_count'] = this.photosCount;
    if (this.popularReviews != null) {
      data['popular_reviews'] =
          this.popularReviews.map((v) => v.toJson()).toList();
    }
    if (this.images != null) {
      data['images'] = this.images.toJson();
    }
    data['blooper_urls'] = this.blooperUrls;
    data['alt'] = this.alt;
    data['collection'] = this.collection;
    data['countries'] = this.countries;
    if (this.bloopers != null) {
      data['bloopers'] = this.bloopers.map((v) => v.toJson()).toList();
    }
    data['tags'] = this.tags;
    if (this.trailers != null) {
      data['trailers'] = this.trailers.map((v) => v.toJson()).toList();
    }
    if (this.popularComments != null) {
      data['popular_comments'] =
          this.popularComments.map((v) => v.toJson()).toList();
    }
    if (this.casts != null) {
      data['casts'] = this.casts.map((v) => v.toJson()).toList();
    }
    data['seasons_count'] = this.seasonsCount;
    data['share_url'] = this.shareUrl;
    data['comments_count'] = this.commentsCount;
    data['reviews_count'] = this.reviewsCount;
    if (this.directors != null) {
      data['directors'] = this.directors.map((v) => v.toJson()).toList();
    }
    data['douban_site'] = this.doubanSite;
    data['mobile_url'] = this.mobileUrl;
    data['title'] = this.title;
    data['has_video'] = this.hasVideo;
    data['subtype'] = this.subtype;
    data['genres'] = this.genres;
    data['do_count'] = this.doCount;
    data['wish_count'] = this.wishCount;
    data['pubdate'] = this.pubdate;
    data['summary'] = this.summary;
    data['website'] = this.website;
    data['original_title'] = this.originalTitle;
    data['languages'] = this.languages;
    if (this.writers != null) {
      data['writers'] = this.writers.map((v) => v.toJson()).toList();
    }
    data['collect_count'] = this.collectCount;
    data['episodes_count'] = this.episodesCount;
    data['aka'] = this.aka;
    data['trailer_urls'] = this.trailerUrls;
    data['mainland_pubdate'] = this.mainlandPubdate;
    return data;
  }
}

class MovieDetailBeanClip {
  String subjectId;
  String small;
  String resourceUrl;
  String alt;
  String medium;
  String id;
  String title;

  MovieDetailBeanClip(
      {this.subjectId,
      this.small,
      this.resourceUrl,
      this.alt,
      this.medium,
      this.id,
      this.title});

  MovieDetailBeanClip.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    alt = json['alt'];
    medium = json['medium'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['alt'] = this.alt;
    data['medium'] = this.medium;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailBeanRating {
  double average;
  int min;
  int max;
  MovieDetailBeanRatingDetails details;
  String stars;

  MovieDetailBeanRating(
      {this.average, this.min, this.max, this.details, this.stars});

  MovieDetailBeanRating.fromJson(Map<String, dynamic> json) {
    average = json['average'];
    min = json['min'];
    max = json['max'];
    details = json['details'] != null
        ? new MovieDetailBeanRatingDetails.fromJson(json['details'])
        : null;
    stars = json['stars'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['average'] = this.average;
    data['min'] = this.min;
    data['max'] = this.max;
    if (this.details != null) {
      data['details'] = this.details.toJson();
    }
    data['stars'] = this.stars;
    return data;
  }
}

class MovieDetailBeanRatingDetails {
  var a1;
  var a2;
  var a3;
  var a4;
  var a5;

  MovieDetailBeanRatingDetails({this.a1, this.a2, this.a3, this.a4, this.a5});

  MovieDetailBeanRatingDetails.fromJson(Map<String, dynamic> json) {
    a1 = json['1'];
    a2 = json['2'];
    a3 = json['3'];
    a4 = json['4'];
    a5 = json['5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['1'] = this.a1;
    data['2'] = this.a2;
    data['3'] = this.a3;
    data['4'] = this.a4;
    data['5'] = this.a5;
    return data;
  }
}

class MovieDetailBeanPhoto {
  String cover;
  String image;
  String thumb;
  String alt;
  String icon;
  String id;

  MovieDetailBeanPhoto(
      {this.cover, this.image, this.thumb, this.alt, this.icon, this.id});

  MovieDetailBeanPhoto.fromJson(Map<String, dynamic> json) {
    cover = json['cover'];
    image = json['image'];
    thumb = json['thumb'];
    alt = json['alt'];
    icon = json['icon'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cover'] = this.cover;
    data['image'] = this.image;
    data['thumb'] = this.thumb;
    data['alt'] = this.alt;
    data['icon'] = this.icon;
    data['id'] = this.id;
    return data;
  }
}

class MovieDetailBeanPopularReview {
  String subjectId;
  String summary;
  MovieDetailBeanPopularReviewsAuthor author;
  MovieDetailBeanPopularReviewsRating rating;
  String alt;
  String id;
  String title;

  MovieDetailBeanPopularReview(
      {this.subjectId,
      this.summary,
      this.author,
      this.rating,
      this.alt,
      this.id,
      this.title});

  MovieDetailBeanPopularReview.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    summary = json['summary'];
    author = json['author'] != null
        ? new MovieDetailBeanPopularReviewsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new MovieDetailBeanPopularReviewsRating.fromJson(json['rating'])
        : null;
    alt = json['alt'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['summary'] = this.summary;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['alt'] = this.alt;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailBeanPopularReviewsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  MovieDetailBeanPopularReviewsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  MovieDetailBeanPopularReviewsAuthor.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    signature = json['signature'];
    alt = json['alt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['signature'] = this.signature;
    data['alt'] = this.alt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}

class MovieDetailBeanPopularReviewsRating {
  var min;
  var max;
  var value;

  MovieDetailBeanPopularReviewsRating({this.min, this.max, this.value});

  MovieDetailBeanPopularReviewsRating.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    data['value'] = this.value;
    return data;
  }
}

class MovieDetailBeanImages {
  String small;
  String large;
  String medium;

  MovieDetailBeanImages({this.small, this.large, this.medium});

  MovieDetailBeanImages.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class MovieDetailBeanBlooper {
  String subjectId;
  String small;
  String resourceUrl;
  String alt;
  String medium;
  String id;
  String title;

  MovieDetailBeanBlooper(
      {this.subjectId,
      this.small,
      this.resourceUrl,
      this.alt,
      this.medium,
      this.id,
      this.title});

  MovieDetailBeanBlooper.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    alt = json['alt'];
    medium = json['medium'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['alt'] = this.alt;
    data['medium'] = this.medium;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailBeanTrailer {
  String subjectId;
  String small;
  String resourceUrl;
  String alt;
  String medium;
  String id;
  String title;

  MovieDetailBeanTrailer(
      {this.subjectId,
      this.small,
      this.resourceUrl,
      this.alt,
      this.medium,
      this.id,
      this.title});

  MovieDetailBeanTrailer.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    small = json['small'];
    resourceUrl = json['resource_url'];
    alt = json['alt'];
    medium = json['medium'];
    id = json['id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    data['small'] = this.small;
    data['resource_url'] = this.resourceUrl;
    data['alt'] = this.alt;
    data['medium'] = this.medium;
    data['id'] = this.id;
    data['title'] = this.title;
    return data;
  }
}

class MovieDetailBeanPopularCommants {
  String subjectId;
  MovieDetailBeanPopularCommentsAuthor author;
  MovieDetailBeanPopularCommentsRating rating;
  String createdAt;
  String id;
  int usefulCount;
  String content;

  MovieDetailBeanPopularCommants(
      {this.subjectId,
      this.author,
      this.rating,
      this.createdAt,
      this.id,
      this.usefulCount,
      this.content});

  MovieDetailBeanPopularCommants.fromJson(Map<String, dynamic> json) {
    subjectId = json['subject_id'];
    author = json['author'] != null
        ? new MovieDetailBeanPopularCommentsAuthor.fromJson(json['author'])
        : null;
    rating = json['rating'] != null
        ? new MovieDetailBeanPopularCommentsRating.fromJson(json['rating'])
        : null;
    createdAt = json['created_at'];
    id = json['id'];
    usefulCount = json['useful_count'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['subject_id'] = this.subjectId;
    if (this.author != null) {
      data['author'] = this.author.toJson();
    }
    if (this.rating != null) {
      data['rating'] = this.rating.toJson();
    }
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['useful_count'] = this.usefulCount;
    data['content'] = this.content;
    return data;
  }
}

class MovieDetailBeanPopularCommentsAuthor {
  String uid;
  String signature;
  String alt;
  String name;
  String avatar;
  String id;

  MovieDetailBeanPopularCommentsAuthor(
      {this.uid, this.signature, this.alt, this.name, this.avatar, this.id});

  MovieDetailBeanPopularCommentsAuthor.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    signature = json['signature'];
    alt = json['alt'];
    name = json['name'];
    avatar = json['avatar'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['signature'] = this.signature;
    data['alt'] = this.alt;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['id'] = this.id;
    return data;
  }
}

class MovieDetailBeanPopularCommentsRating {
  int min;
  int max;
  double value;

  MovieDetailBeanPopularCommentsRating({this.min, this.max, this.value});

  MovieDetailBeanPopularCommentsRating.fromJson(Map<String, dynamic> json) {
    min = json['min'];
    max = json['max'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['min'] = this.min;
    data['max'] = this.max;
    data['value'] = this.value;
    return data;
  }
}

class MovieDetailBeanCast {
  String name;
  String alt;
  String id;
  MovieDetailBeanCastsAvatars avatars;
  String nameEn;

  MovieDetailBeanCast(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailBeanCast.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailBeanCastsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class MovieDetailBeanCastsAvatars {
  String small;
  String large;
  String medium;

  MovieDetailBeanCastsAvatars({this.small, this.large, this.medium});

  MovieDetailBeanCastsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class MovieDetailBeanDirector {
  String name;
  String alt;
  String id;
  MovieDetailBeanDirectorsAvatars avatars;
  String nameEn;

  MovieDetailBeanDirector(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailBeanDirector.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailBeanDirectorsAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class MovieDetailBeanDirectorsAvatars {
  String small;
  String large;
  String medium;

  MovieDetailBeanDirectorsAvatars({this.small, this.large, this.medium});

  MovieDetailBeanDirectorsAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

class MovieDetailBeanWriter {
  String name;
  String alt;
  String id;
  MovieDetailBeanWritersAvatars avatars;
  String nameEn;

  MovieDetailBeanWriter(
      {this.name, this.alt, this.id, this.avatars, this.nameEn});

  MovieDetailBeanWriter.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    alt = json['alt'];
    id = json['id'];
    avatars = json['avatars'] != null
        ? new MovieDetailBeanWritersAvatars.fromJson(json['avatars'])
        : null;
    nameEn = json['name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['alt'] = this.alt;
    data['id'] = this.id;
    if (this.avatars != null) {
      data['avatars'] = this.avatars.toJson();
    }
    data['name_en'] = this.nameEn;
    return data;
  }
}

class MovieDetailBeanWritersAvatars {
  String small;
  String large;
  String medium;

  MovieDetailBeanWritersAvatars({this.small, this.large, this.medium});

  MovieDetailBeanWritersAvatars.fromJson(Map<String, dynamic> json) {
    small = json['small'];
    large = json['large'];
    medium = json['medium'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['small'] = this.small;
    data['large'] = this.large;
    data['medium'] = this.medium;
    return data;
  }
}

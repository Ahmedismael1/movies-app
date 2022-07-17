class TrendingModel {
  int page;
  List<TrendingModelResults> results;

  TrendingModel({this.page, this.results, });

  TrendingModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    if (json['results'] != null) {
      results = <TrendingModelResults>[];
      json['results'].forEach((v) {
        results.add(new TrendingModelResults.fromJson(v));
      });
    }

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page'] = this.page;
    if (this.results != null) {
      data['results'] = this.results.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class TrendingModelResults {
  String overview;
  String releaseDate;
  bool adult;
  String backdropPath;
  int voteCount;
  List<int> genreIds;
  bool video;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  int id;
  String title;
  double voteAverage;
  double popularity;
  String mediaType;
  String firstAirDate;
  String originalName;
  String name;


  TrendingModelResults.fromJson(Map<String, dynamic> json) {
    overview = json['overview'];
    releaseDate = json['release_date'];
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    voteCount = json['vote_count'];
    genreIds = json['genre_ids'].cast<int>();
    video = json['video'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    id = json['id'];
    title = json['title'];
    voteAverage = json['vote_average'];
    popularity = json['popularity'];
    mediaType = json['media_type'];
    firstAirDate = json['first_air_date'];
    originalName = json['original_name'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['adult'] = this.adult;
    data['backdrop_path'] = this.backdropPath;
    data['vote_count'] = this.voteCount;
    data['genre_ids'] = this.genreIds;
    data['video'] = this.video;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['id'] = this.id;
    data['title'] = this.title;
    data['vote_average'] = this.voteAverage;
    data['popularity'] = this.popularity;
    data['media_type'] = this.mediaType;
    data['first_air_date'] = this.firstAirDate;
    data['original_name'] = this.originalName;
    data['name'] = this.name;
    return data;
  }
}

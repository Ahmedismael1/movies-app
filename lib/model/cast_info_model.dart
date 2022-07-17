class CastInfoModel {
  bool adult;
  List<String> alsoKnownAs;
  String biography;
  String birthday;
  int gender;
  int id;
  String imdbId;
  String knownForDepartment;
  String name;
  String placeOfBirth;
  double popularity;
  String profilePath;

  CastInfoModel(
      {this.adult,
        this.alsoKnownAs,
        this.biography,
        this.birthday,
        this.gender,
        this.id,
        this.imdbId,
        this.knownForDepartment,
        this.name,
        this.placeOfBirth,
        this.popularity,
        this.profilePath});

  CastInfoModel.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    alsoKnownAs = json['also_known_as'].cast<String>();
    biography = json['biography'];
    birthday = json['birthday'];
    gender = json['gender'];
    id = json['id'];
    imdbId = json['imdb_id'];
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    placeOfBirth = json['place_of_birth'];
    popularity = json['popularity'];
    profilePath = json['profile_path'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['adult'] = this.adult;
    data['also_known_as'] = this.alsoKnownAs;
    data['biography'] = this.biography;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    data['id'] = this.id;
    data['imdb_id'] = this.imdbId;
    data['known_for_department'] = this.knownForDepartment;
    data['name'] = this.name;
    data['place_of_birth'] = this.placeOfBirth;
    data['popularity'] = this.popularity;
    data['profile_path'] = this.profilePath;
    return data;
  }
}

class CastImageModel {
  int id;
  List<Profiles> profiles;

  CastImageModel({this.id, this.profiles});

  CastImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['profiles'] != null) {
      profiles = <Profiles>[];
      json['profiles'].forEach((v) {
        profiles.add(new Profiles.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.profiles != null) {
      data['profiles'] = this.profiles.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Profiles {
  double aspectRatio;
  int height;
  String filePath;
  double voteAverage;
  int voteCount;
  int width;

  Profiles(
      {this.aspectRatio,
        this.height,
        this.filePath,
        this.voteAverage,
        this.voteCount,
        this.width});

  Profiles.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aspect_ratio'] = this.aspectRatio;
    data['height'] = this.height;
    data['file_path'] = this.filePath;
    data['vote_average'] = this.voteAverage;
    data['vote_count'] = this.voteCount;
    data['width'] = this.width;
    return data;
  }
}


class CastMoviesModel {
  List<CastMovies> castMovies;
  int id;

  CastMoviesModel({this.castMovies, this.id});

  CastMoviesModel.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      castMovies = <CastMovies>[];
      json['cast'].forEach((v) {
        castMovies.add(new CastMovies.fromJson(v));
      });
    }

    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.castMovies != null) {
      data['cast'] = this.castMovies.map((v) => v.toJson()).toList();
    }

    data['id'] = this.id;
    return data;
  }
}

class CastMovies {
  String backdropPath;
  int id;
  List<int> genreIds;
  String originalLanguage;
  String originalTitle;
  String posterPath;
  String title;
  bool video;
  double voteAverage;
  String overview;
  String releaseDate;
  int voteCount;
  bool adult;
  double popularity;
  String character;
  String creditId;
  int order;

  CastMovies(
      {this.backdropPath,
        this.id,
        this.genreIds,
        this.originalLanguage,
        this.originalTitle,
        this.posterPath,
        this.title,
        this.video,
        this.voteAverage,
        this.overview,
        this.releaseDate,
        this.voteCount,
        this.adult,
        this.popularity,
        this.character,
        this.creditId,
        this.order});

  CastMovies.fromJson(Map<String, dynamic> json) {
    backdropPath = json['backdrop_path'];
    id = json['id'];
    genreIds = json['genre_ids'].cast<int>();
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    posterPath = json['poster_path'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    voteCount = json['vote_count'];
    adult = json['adult'];
    popularity = json['popularity'];
    character = json['character'];
    creditId = json['credit_id'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['backdrop_path'] = this.backdropPath;
    data['id'] = this.id;
    data['genre_ids'] = this.genreIds;
    data['original_language'] = this.originalLanguage;
    data['original_title'] = this.originalTitle;
    data['poster_path'] = this.posterPath;
    data['title'] = this.title;
    data['video'] = this.video;
    data['vote_average'] = this.voteAverage;
    data['overview'] = this.overview;
    data['release_date'] = this.releaseDate;
    data['vote_count'] = this.voteCount;
    data['adult'] = this.adult;
    data['popularity'] = this.popularity;
    data['character'] = this.character;
    data['credit_id'] = this.creditId;
    data['order'] = this.order;
    return data;
  }

}



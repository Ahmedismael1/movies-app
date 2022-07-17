class TrailersModel {
  int id;
  List<TrailersResults> trailersResults;

  TrailersModel({this.id, this.trailersResults});

  TrailersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['results'] != null) {
      trailersResults = <TrailersResults>[];
      json['results'].forEach((v) {
        trailersResults.add(new TrailersResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.trailersResults != null) {
      data['results'] = this.trailersResults.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TrailersResults {
  String iso6391;
  String iso31661;
  String name;
  String key;
  String publishedAt;
  String site;
  int size;
  String type;
  bool official;
  String id;

  TrailersResults(
      {this.iso6391,
        this.iso31661,
        this.name,
        this.key,
        this.publishedAt,
        this.site,
        this.size,
        this.type,
        this.official,
        this.id});

  TrailersResults.fromJson(Map<String, dynamic> json) {
    iso6391 = json['iso_639_1'];
    iso31661 = json['iso_3166_1'];
    name = json['name'];
    key = json['key'];
    publishedAt = json['published_at'];
    site = json['site'];
    size = json['size'];
    type = json['type'];
    official = json['official'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['iso_639_1'] = this.iso6391;
    data['iso_3166_1'] = this.iso31661;
    data['name'] = this.name;
    data['key'] = this.key;
    data['published_at'] = this.publishedAt;
    data['site'] = this.site;
    data['size'] = this.size;
    data['type'] = this.type;
    data['official'] = this.official;
    data['id'] = this.id;
    return data;
  }
}

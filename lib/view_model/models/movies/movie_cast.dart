class MovieCast {
  int? actorId;
  String? actorName;
  String? imageUrl;
  int? movieId;

  MovieCast({this.actorId, this.actorName, this.imageUrl, this.movieId});

  MovieCast.fromJson(Map<String, dynamic> json) {
    actorId = json['actorId'];
    actorName = json['actorName'];
    imageUrl = json['imageUrl'];
    movieId = json['movieId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['actorId'] = actorId;
    data['actorName'] = actorName;
    data['imageUrl'] = imageUrl;
    data['movieId'] = movieId;
    return data;
  }
}

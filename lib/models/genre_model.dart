class Genre {
  List<String>? genres;

  Genre({this.genres});

  Genre.fromJson(Map<String, dynamic> json) {
    genres = json['genres'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['genres'] = this.genres;
    return data;
  }
}

class EpisodesModel {
  EpisodesModel({
    this.episodeId,
    this.title,
    this.season,
    this.airDate,
    this.characters,
    this.episode,
    this.series,
  });

  EpisodesModel.fromJson(dynamic json) {
    episodeId = json['episode_id'];
    title = json['title'];
    season = json['season'];
    airDate = json['air_date'];
    characters =
        json['characters'] != null ? json['characters'].cast<String>() : [];
    episode = json['episode'];
    series = json['series'];
  }

  int? episodeId;
  String? title;
  String? season;
  String? airDate;
  List<String>? characters;
  String? episode;
  String? series;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['episode_id'] = episodeId;
    map['title'] = title;
    map['season'] = season;
    map['air_date'] = airDate;
    map['characters'] = characters;
    map['episode'] = episode;
    map['series'] = series;
    return map;
  }
}

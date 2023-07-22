class RandomQuotesAnimeModel {
  String? anime;
  String? character;
  String? quote;

  RandomQuotesAnimeModel({
    this.anime,
    this.character,
    this.quote,
  });

  factory RandomQuotesAnimeModel.fromJson(Map<String, dynamic> json) =>
      RandomQuotesAnimeModel(
        anime: json["anime"],
        character: json["character"],
        quote: json["quote"],
      );

  Map<String, dynamic> toJson() => {
        "anime": anime,
        "character": character,
        "quote": quote,
      };
}


/// quote_id : 28
/// quote : "I'm waiting for the cancer to come back."
/// author : "Skyler White"
/// series : "Breaking Bad"

class QuotesModel {
  QuotesModel({
    this.quoteId,
    this.quote,
    this.author,
    this.series,
  });

  QuotesModel.fromJson(dynamic json) {
    quoteId = json['quote_id'];
    quote = json['quote'];
    author = json['author'];
    series = json['series'];
  }

  num? quoteId;
  String? quote;
  String? author;
  String? series;

  QuotesModel copyWith({
    num? quoteId,
    String? quote,
    String? author,
    String? series,
  }) =>
      QuotesModel(
        quoteId: quoteId ?? this.quoteId,
        quote: quote ?? this.quote,
        author: author ?? this.author,
        series: series ?? this.series,
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['quote_id'] = quoteId;
    map['quote'] = quote;
    map['author'] = author;
    map['series'] = series;
    return map;
  }
}

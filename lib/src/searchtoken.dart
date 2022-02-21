class SearchToken {
  final String text;
  final List<String> tokens;

  SearchToken({required this.text, required this.tokens});

  Map<String, Object> toJson() {
    return {
      "text": text,
      "tokens": tokens
    };
  }

  factory SearchToken.fromJson(Map map) {
    try {
      return SearchToken(
        text: map["text"] as String,
        tokens: (map["tokens"] as Iterable).cast<String>().toList()
      );
    } catch(_) {
      throw Exception("Unable to load SearchToken from map. Invalid value: $map");
    }
  }
}
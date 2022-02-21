import 'package:fuzzysearch/fuzzysearch.dart';
import 'package:collection/collection.dart';

class FuzzySearch {
  final FuzzySearchOptions _options;
  final List<List<String>> _tokens;
  final List<String> _source;

  /// The list of tokens for the current data source.
  Iterable<SearchToken> get tokens => _source.mapIndexed((index, element) => SearchToken(
    text: element,
    tokens: _tokens[index]
  ));

  FuzzySearch.create({required List<String> source, FuzzySearchOptions options = const FuzzySearchOptions()}) 
    : _source = source,
      _tokens = source.map((e) => options.tokenizer.tokenize(e)).toList(),
      _options = options;

  FuzzySearch.load({required List<SearchToken> tokens, FuzzySearchOptions options = const FuzzySearchOptions()})
    : _source = tokens.map((e) => e.text).toList(),
      _tokens = tokens.map((e) => e.tokens).toList(),
      _options = options;

  Future<Iterable<SearchMatch>> search(String term) async {
    return [];
  }
}
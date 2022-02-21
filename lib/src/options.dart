import 'package:fuzzysearch/fuzzysearch.dart';
import 'package:fuzzysearch/src/tokenizer/default_tokenizer.dart';

class FuzzySearchOptions {

  final int limit;
  final double threshold;
  final bool typoTolerant;
  final TokenizerBase tokenizer;

  const FuzzySearchOptions({this.limit = 10, this.threshold = double.infinity, this.typoTolerant = false, this.tokenizer = const DefaultTokenizer()});
}
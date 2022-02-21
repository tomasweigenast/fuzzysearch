import 'package:fuzzysearch/fuzzysearch.dart';
import 'package:fuzzysearch/src/utils/diacritic.dart';

final _splitRegex = RegExp("[\\s,._-]+");

class DefaultTokenizer implements TokenizerBase {
  final int minTokenLength;
  
  const DefaultTokenizer({this.minTokenLength = 2});

  @override
  List<String> tokenize(String input) {
    return input.split(_splitRegex).where((element) => element.length > minTokenLength).map((e) => removeDiacritics(e).toLowerCase()).toList();
  }
}
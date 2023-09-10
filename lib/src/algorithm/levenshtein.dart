/// The Levenshtein algorithm measures the difference between two strings as single-character edits (insertions, substitutions, etc.)
///
/// This is based on the C implementation found here:
/// http://en.wikibooks.org/wiki/Algorithm_implementation/Strings/Levenshtein_distance#C
///
/// Its space complexity is O(min(a,b))
int levenshteinDistance(String a, String b) {
  final aLen = a.length;
  final bLen = b.length;

  final List<int> matrix = List.filled(aLen + 1, 0);
  for (int y = 1; y <= aLen; y++) {
    matrix[y] = y;
  }

  for (int x = 1; x <= bLen; x++) {
    matrix[0] = x;
    for (int y = 1, lastDiag = x - 1; y <= aLen; y++) {
      final oldDiag = matrix[y];
      matrix[y] = min3(matrix[y] + 1, matrix[y - 1] + 1, lastDiag + (a[y - 1] == b[x - 1] ? 0 : 1));
      lastDiag = oldDiag;
    }
  }

  return matrix[aLen];
}

int min3(int a, int b, int c) => a < b
    ? a < c
        ? a
        : c
    : b < c
        ? b
        : c;

import 'package:fuzzysearch/src/algorithm/levenshtein.dart';
import 'package:test/test.dart';

void main() {
  test("min3", () {
    expect(min3(5, 2, 9), equals(2));
    expect(min3(1, 2, 9), equals(1));
    expect(min3(0, 2, -5), equals(-5));
  });

  group("levenshtein distance", () {
    const tests = <_TestCase>[
      _TestCase("a", "a", 0),
      _TestCase("ab", "ab", 0),
      _TestCase("ab", "aa", 1),
      _TestCase("ab", "aaa", 2),
      _TestCase("ab", "ad", 1),
      _TestCase("bbbbb", "a", 5),
      _TestCase("cat", "dog", 3),
      _TestCase("cat", "cat", 0),
      _TestCase("kitten", "sitting", 3),
      _TestCase("book", "back", 2),
      _TestCase("algorithm", "logarithm", 3),
      _TestCase("perro", "perra", 1),
      _TestCase("casa", "calle", 3),
      _TestCase("hola", "chao", 4),
      _TestCase("amor", "odio", 4),
      _TestCase("你好", "你好", 0),
      _TestCase("中国", "中华", 1),
      _TestCase("学习", "研究", 2),
      _TestCase("家庭", "家居", 1),
      _TestCase("hello", "你好", 5),
      _TestCase("apple", "苹果", 5),
      _TestCase("amigo", "friend", 5),
    ];
    for (final testcase in tests) {
      test("levenshtein(${testcase.a},${testcase.b}) = ${testcase.wantDistance}", () {
        final got = levenshteinDistance(testcase.a, testcase.b);
        expect(got, equals(testcase.wantDistance));
      });
    }
  });
}

class _TestCase {
  final String a;
  final String b;
  final int wantDistance;

  const _TestCase(this.a, this.b, this.wantDistance);
}

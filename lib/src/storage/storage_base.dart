import 'package:fuzzysearch/src/model/index.dart';

/// An interface that defines methods to store and read fuzzy indexes.
abstract interface class FuzzyStorageBase {
  /// Reads a [FuzzyIndex] stored in the given [key].
  FuzzyIndex? read(String key);

  /// Writes an [FuzzyIndex] [index] in the given [key].
  Future<void> write(String key, FuzzyIndex index);

  /// Deletes a [FuzzyIndex] at the given [key].
  Future<void> delete(String key);

  /// Clears every saved [FuzzyIndex].
  Future<void> clear();
}

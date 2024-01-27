import 'dart:typed_data';

/// Writes binary data.
final class BufferWriter {
  final List<Uint8List> _chunks = [];
  int _totalLength = 0;

  Uint8List take() {
    final buffer = Uint8List(_totalLength);
    var pos = 0;
    for (final chunk in _chunks) {
      buffer.setRange(pos, chunk.length, chunk);
      pos += chunk.length;
    }

    return buffer;
  }
}

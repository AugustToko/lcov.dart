part of lcov;

/// Provides the coverage data of functions.
class FunctionCoverage {

  /// Creates a new function coverage.
  FunctionCoverage([this.found = 0, this.hit = 0, List<FunctionData> data]): data = data ?? [];

  /// Creates a new function coverage from the specified [map] in JSON format.
  FunctionCoverage.fromJson(Map<String, dynamic> map):
    data = map['data'] is List<Map<String, int>> ? map['data'].map((item) => new FunctionData.fromJson(item)).toList() : [],
    found = map['found'] is int ? map['found'] : 0,
    hit = map['hit'] is int ? map['hit'] : 0;

  /// The coverage data.
  final List<FunctionData> data;

  /// The number of functions found.
  int found;

  /// The number of functions hit.
  int hit;

  /// Converts this object to a map in JSON format.
  Map<String, dynamic> toJson() => {
    'data': data.map((item) => item.toJson()).toList(),
    'found': found,
    'hit': hit
  };

  /// Returns a string representation of this object.
  @override
  String toString() {
    var buffer = new StringBuffer();
    if (data.isNotEmpty) buffer
      ..writeAll(data.map((item) => item.toString(asDefinition: true)), '\n')..writeln()
      ..writeAll(data.map((item) => item.toString(asDefinition: false)), '\n')..writeln();

    buffer
      ..writeln('${Token.functionsFound}:$found')
      ..write('${Token.functionsHit}:$hit');

    return buffer.toString();
  }
}

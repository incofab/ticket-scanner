import 'package:ticket_scanner/models/event.dart';

class PaginatedData<T> {
  int total;
  int per_page;
  int current_page;
  int last_page;
  String first_page_url;
  String last_page_url;
  String? next_page_url;
  String? prev_page_url;
  String path;
  int? from;
  int? to;
  List<T> data;

  PaginatedData({
    required this.total,
    required this.per_page,
    required this.current_page,
    required this.last_page,
    required this.first_page_url,
    required this.last_page_url,
    this.next_page_url,
    this.prev_page_url,
    required this.path,
    this.from,
    this.to,
    required this.data,
  });

  static T? _getDataFromJson<T>(Object json, Type type) {
    switch (type) {
      case String:
        return json.toString() as T;
      case Event:
        return Event.fromJson(json as Map<String, dynamic>) as T;
      case List:
        final list = (json as List);
        if (list.isEmpty) {
          return null;
        }
        final first = list.first();
        return list.map((e) => _getDataFromJson(e, first.runtimeType)).toList()
            as T;
      default:
        throw ArgumentError.value(
          json,
          'json',
          'PaginatedData: Cannot convert the provided data. of type $type',
        );
    }
  }

  static PaginatedData<T> fromJson<T>(Map<String, dynamic> json) {
    final data = json['data'] as List;
    final dataFormattedList = <T>[];
    for (var item in data) {
      dataFormattedList.add(_getDataFromJson(item as Object, T));
    }
    return fromMap({...json, 'data': dataFormattedList});
  }

  static PaginatedData<T> fromMap<T>(Map<String, dynamic> json) {
    return PaginatedData<T>(
      total: json['total'] as int,
      per_page: json['per_page'],
      current_page: json['current_page'],
      last_page: json['last_page'],
      first_page_url: json['first_page_url'],
      last_page_url: json['last_page_url'],
      next_page_url: json['next_page_url'],
      prev_page_url: json['prev_page_url'],
      path: json['path'],
      from: json['from'],
      to: json['to'],
      data: json['data'],
    );
  }
}

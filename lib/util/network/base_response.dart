import 'package:ticket_scanner/models/event.dart';

class BaseResponse<T> {
  bool? success = false;
  String? message;
  String? result;
  String? time;

  T? data;

  BaseResponse({
    required this.success,
    this.message = '',
    this.result,
    this.time,
    this.data,
  });

  BaseResponse.message(this.message);

  bool isSuccessful() {
    return success ?? false;
  }

  static List<T> handleList<T>(Object? json) {
    final list = (json as List);
    return list.isEmpty
        ? []
        : list.map((e) => _getDataFromJson<T>(e, T)!).toList();
  }

  static T? _getDataFromJson<T>(Object? json, Type type) {
    if (json == null) {
      return null;
    }
    switch (type) {
      case String:
        return json.toString() as T;
      case Event:
        return Event.fromJson(json as Map<String, dynamic>) as T;
      // case Topic:
      //   return Topic.fromJson(json as Map<String, dynamic>) as T;
      // case Course:
      //   return Course.fromJson(json as Map<String, dynamic>) as T;
      // case Thread:
      //   return Thread.fromJson(json as Map<String, dynamic>) as T;
      // case Post:
      //   return Post.fromJson(json as Map<String, dynamic>) as T;
      // case Center:
      //   return Center.fromJson(json as Map<String, dynamic>) as T;
      // case AppNotification:
      //   return AppNotification.fromJson(json as Map<String, dynamic>) as T;
      // case const (PaginatedData<Thread>):
      //   return PaginatedData.fromJson<Thread>(json as Map<String, dynamic>)
      //       as T;
      // case const (PaginatedData<Post>):
      //   return PaginatedData.fromJson<Post>(json as Map<String, dynamic>) as T;
      // case const (List<Event>):
      //   return handleList<Event>(json) as T;
      // case const (List<AppNotification>):
      //   return handleList<AppNotification>(json) as T;
      // case CareerGuideData:
      //   return CareerGuideData.fromJson(json as Map<String, dynamic>) as T;
      default:
        print('BaseResponse: Unknown type $type');
        return json as T;
    }
  }

  static BaseResponse<T?> fromJson<T>(Map<String, dynamic> json) {
    return BaseResponse<T?>(
      success: json['success'] as bool? ?? false,
      message: json['message'] as String? ?? '',
      result: json['result'] as String?,
      time: json['time'] as String?,
      data: _getDataFromJson(json['data'] as Object?, T),
    );
  }
}

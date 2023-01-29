import 'package:machineglow/core/api/core.dart';

class PictureResponse extends ApiResponse {
  final bool success;
  final String message;
  final String imageUrl;

  PictureResponse(
      {required this.success, required this.message, required this.imageUrl});

  factory PictureResponse.fromJson(Map<String, dynamic> json) {
    return PictureResponse(
      success: json['success'],
      message: json['message'],
      imageUrl: json['data']['url'],
    );
  }
  @override
  String toString() {
    return 'success:$success, message: $message, url: $imageUrl';
  }
}

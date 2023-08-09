class CardResponse {
  bool? success;
  String? message;

  CardResponse({
    this.success,
    this.message,
  });

  factory CardResponse.fromJson(Map<String, dynamic> json) => CardResponse(
        success: json["SUCCESS"],
        message: json["MESSAGE"],
      );

  Map<String, dynamic> toJson() => {
        "SUCCESS": success,
        "MESSAGE": message,
      };
}

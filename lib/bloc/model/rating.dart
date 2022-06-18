class Rating {
  String value;
  Rating(this.value);

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        json['value'] as String,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'value': this.value,
      };
}

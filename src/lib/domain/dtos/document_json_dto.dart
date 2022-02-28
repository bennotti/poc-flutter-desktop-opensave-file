class DocumentJsonDto {
  final String title;
  final String details;

  DocumentJsonDto(this.title, this.details);

  DocumentJsonDto.fromJson(Map<String, dynamic> json)
      : title = json['title'],
        details = json['details'];

  Map<String, dynamic> toJson() => {
        'title': title,
        'details': details,
      };
}

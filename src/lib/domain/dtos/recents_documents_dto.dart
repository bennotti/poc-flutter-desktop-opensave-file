class RecentsDocumentsDto {
  List<String> files = [];

  RecentsDocumentsDto();

  RecentsDocumentsDto.fromJson(Map<String, dynamic> json) {
    // files = json['files'];
    var objsJson = json['files'] as List;
    files = objsJson.map((p) => p as String).toList();
  }

  Map<String, dynamic> toJson() => {
        'files': files,
      };
}

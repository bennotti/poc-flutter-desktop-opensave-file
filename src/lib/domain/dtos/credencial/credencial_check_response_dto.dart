class CredencialCheckResponseDto {
  String username;
  String name;

  CredencialCheckResponseDto({this.username = '', this.name = ''});

  CredencialCheckResponseDto.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        name = json['name'];

  Map<String, dynamic> toJson() => {
        'username': username,
        'name': username,
      };
}

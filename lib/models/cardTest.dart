import 'package:json_annotation/json_annotation.dart';

part 'cardTest.g.dart';

@JsonSerializable()
class CardTest {
    CardTest();

    String no;
    String name;
    
    factory CardTest.fromJson(Map<String,dynamic> json) => _$CardTestFromJson(json);
    Map<String, dynamic> toJson() => _$CardTestToJson(this);
}

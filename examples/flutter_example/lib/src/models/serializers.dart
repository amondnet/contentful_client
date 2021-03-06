library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_example/src/models/post.dart';
import 'package:flutter_example/src/models/post_fields.dart';
import 'package:contentful_client/contentful_client.dart';
import 'package:flutter_example/src/prototyping_ui/photo.dart';

part 'serializers.g.dart';

@SerializersFor([
  Post,
  PostFields,
  Photo,
])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();

T deserialize<T>(dynamic value) =>
    serializers.deserializeWith<T>(serializers.serializerForType(T), value);

BuiltList<T> deserializeListOf<T>(dynamic items) => BuiltList.from(
    items.map((item) => deserialize<T>(item)).toList(growable: false));

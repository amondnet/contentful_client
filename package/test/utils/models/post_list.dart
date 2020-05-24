library post_list;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:contentful_client/src/models/entry/entry_list.dart';
import 'package:contentful_client/src/models/system_fields/system_fields.dart';

import 'post.dart';
import 'serializers.dart';

part 'post_list.g.dart';

abstract class PostList extends Object
    with EntryList<Post>
    implements Built<PostList, PostListBuilder> {
  static Serializer<PostList> get serializer => _$postListSerializer;

  factory PostList([void Function(PostListBuilder) updates]) = _$PostList;

  PostList._();

  @override
  BuiltListMultimap get includes;

  @override
  BuiltList<Post> get items;

  @override
  int get limit;

  @override
  int get skip;

  @override
  SystemFields get sys;

  @override
  int get total;

  String toJson() {
    return json.encode(serializers.serializeWith(PostList.serializer, this));
  }

  static PostList fromJson(String jsonString) {
    return serializers.deserializeWith(
        PostList.serializer, json.decode(jsonString));
  }
}

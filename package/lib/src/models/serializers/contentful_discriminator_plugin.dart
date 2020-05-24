import 'package:built_value/serializer.dart';
import 'package:contentful_client/src/models/models.dart';

class ContentfulDiscriminatorPlugin extends SerializerPlugin {
  @override
  Object afterDeserialize(Object object, FullType specifiedType) {
    return object;
  }

  @override
  Object afterSerialize(Object object, FullType specifiedType) {
    return object;
  }

  @override
  Object beforeDeserialize(Object object, FullType specifiedType) {
    if (specifiedType.root == EntryList) {
      print('====ContentfulJsonPlugin====: ${specifiedType.root} $object');
    }
    return object;
  }

  @override
  Object beforeSerialize(Object object, FullType specifiedType) {
    return object;
  }
}

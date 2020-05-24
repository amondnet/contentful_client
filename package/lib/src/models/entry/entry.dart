import 'package:contentful_client/src/models/models.dart';

mixin Entry<T> {
  SystemFields sys;
  T fields;
}

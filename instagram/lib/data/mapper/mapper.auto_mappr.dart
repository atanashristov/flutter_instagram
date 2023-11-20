// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoMapprGenerator
// **************************************************************************

// ignore_for_file: type=lint, unnecessary_cast, unused_local_variable

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_mappr_annotation/auto_mappr_annotation.dart' as _i1;

import '../../domain/entities/post.dart' as _i5;
import '../../domain/entities/user.dart' as _i3;
import '../models/post_model.dart' as _i4;
import '../models/user_model.dart' as _i2;

/// {@template package:instagram/data/mapper/mapper.dart}
/// Available mappings:
/// - `UserModel` → `User`.
/// - `User` → `UserModel`.
/// - `PostModel` → `Post`.
/// - `Post` → `PostModel`.
/// {@endtemplate}
class $Mappr implements _i1.AutoMapprInterface {
  const $Mappr();

  Type _typeOf<T>() => T;

  List<_i1.AutoMapprInterface> get _delegates => const [];

  /// {@macro AutoMapprInterface:canConvert}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  bool canConvert<SOURCE, TARGET>({bool recursive = true}) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserModel>() ||
            sourceTypeOf == _typeOf<_i2.UserModel?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i3.User>() ||
            sourceTypeOf == _typeOf<_i3.User?>()) &&
        (targetTypeOf == _typeOf<_i2.UserModel>() ||
            targetTypeOf == _typeOf<_i2.UserModel?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i4.PostModel>() ||
            sourceTypeOf == _typeOf<_i4.PostModel?>()) &&
        (targetTypeOf == _typeOf<_i5.Post>() ||
            targetTypeOf == _typeOf<_i5.Post?>())) {
      return true;
    }
    if ((sourceTypeOf == _typeOf<_i5.Post>() ||
            sourceTypeOf == _typeOf<_i5.Post?>()) &&
        (targetTypeOf == _typeOf<_i4.PostModel>() ||
            targetTypeOf == _typeOf<_i4.PostModel?>())) {
      return true;
    }
    if (recursive) {
      for (final mappr in _delegates) {
        if (mappr.canConvert<SOURCE, TARGET>()) {
          return true;
        }
      }
    }
    return false;
  }

  /// {@macro AutoMapprInterface:convert}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  TARGET convert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(model)!;
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convert(model)!;
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:tryConvert}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  TARGET? tryConvert<SOURCE, TARGET>(SOURCE? model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return _convert(
        model,
        canReturnNull: true,
      );
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvert(model);
      }
    }

    return null;
  }

  /// {@macro AutoMapprInterface:convertIterable}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  Iterable<TARGET> convertIterable<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET>((item) => _convert(item)!);
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Iterable.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  Iterable<TARGET?> tryConvertIterable<SOURCE, TARGET>(
      Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return model.map<TARGET?>((item) => _convert(item, canReturnNull: true));
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertIterable(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertList}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  List<TARGET> convertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into List.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  List<TARGET?> tryConvertList<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toList();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertList(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// {@macro AutoMapprInterface:convertSet}
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  Set<TARGET> convertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return convertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.convertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  /// For iterable items, converts from SOURCE to TARGET if such mapping is configured, into Set.
  ///
  /// When an item in the source iterable is null, uses `whenSourceIsNull` if defined or null
  ///
  /// {@macro package:instagram/data/mapper/mapper.dart}
  @override
  Set<TARGET?> tryConvertSet<SOURCE, TARGET>(Iterable<SOURCE?> model) {
    if (canConvert<SOURCE, TARGET>(recursive: false)) {
      return tryConvertIterable<SOURCE, TARGET>(model).toSet();
    }
    for (final mappr in _delegates) {
      if (mappr.canConvert<SOURCE, TARGET>()) {
        return mappr.tryConvertSet(model);
      }
    }

    throw Exception('No ${_typeOf<SOURCE>()} -> ${_typeOf<TARGET>()} mapping.');
  }

  TARGET? _convert<SOURCE, TARGET>(
    SOURCE? model, {
    bool canReturnNull = false,
  }) {
    final sourceTypeOf = _typeOf<SOURCE>();
    final targetTypeOf = _typeOf<TARGET>();
    if ((sourceTypeOf == _typeOf<_i2.UserModel>() ||
            sourceTypeOf == _typeOf<_i2.UserModel?>()) &&
        (targetTypeOf == _typeOf<_i3.User>() ||
            targetTypeOf == _typeOf<_i3.User?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i2$UserModel_To__i3$User((model as _i2.UserModel?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i3.User>() ||
            sourceTypeOf == _typeOf<_i3.User?>()) &&
        (targetTypeOf == _typeOf<_i2.UserModel>() ||
            targetTypeOf == _typeOf<_i2.UserModel?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i3$User_To__i2$UserModel((model as _i3.User?)) as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i4.PostModel>() ||
            sourceTypeOf == _typeOf<_i4.PostModel?>()) &&
        (targetTypeOf == _typeOf<_i5.Post>() ||
            targetTypeOf == _typeOf<_i5.Post?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i4$PostModel_To__i5$Post((model as _i4.PostModel?))
          as TARGET);
    }
    if ((sourceTypeOf == _typeOf<_i5.Post>() ||
            sourceTypeOf == _typeOf<_i5.Post?>()) &&
        (targetTypeOf == _typeOf<_i4.PostModel>() ||
            targetTypeOf == _typeOf<_i4.PostModel?>())) {
      if (canReturnNull && model == null) {
        return null;
      }
      return (_map__i5$Post_To__i4$PostModel((model as _i5.Post?)) as TARGET);
    }
    throw Exception('No ${model.runtimeType} -> $targetTypeOf mapping.');
  }

  _i3.User _map__i2$UserModel_To__i3$User(_i2.UserModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping UserModel → User failed because UserModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<UserModel, User> to handle null values during mapping.');
    }
    return _i3.User(
      id: model.id,
      username: model.username,
      email: model.email,
      profileImageUrl: model.profileImageUrl,
      followers: model.followers,
      following: model.following,
      bio: model.bio,
    );
  }

  _i2.UserModel _map__i3$User_To__i2$UserModel(_i3.User? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping User → UserModel failed because User was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<User, UserModel> to handle null values during mapping.');
    }
    return _i2.UserModel(
      id: model.id,
      username: model.username,
      email: model.email,
      profileImageUrl: model.profileImageUrl,
      followers: model.followers,
      following: model.following,
      bio: model.bio,
    );
  }

  _i5.Post _map__i4$PostModel_To__i5$Post(_i4.PostModel? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping PostModel → Post failed because PostModel was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<PostModel, Post> to handle null values during mapping.');
    }
    return _i5.Post(
      id: model.id,
      caption: model.caption,
      imageUrl: model.imageUrl,
      likes: model.likes,
      date: model.date,
    );
  }

  _i4.PostModel _map__i5$Post_To__i4$PostModel(_i5.Post? input) {
    final model = input;
    if (model == null) {
      throw Exception(
          r'Mapping Post → PostModel failed because Post was null, and no default value was provided. '
          r'Consider setting the whenSourceIsNull parameter on the MapType<Post, PostModel> to handle null values during mapping.');
    }
    return _i4.PostModel(
      id: model.id,
      caption: model.caption,
      imageUrl: model.imageUrl,
      likes: model.likes,
      date: model.date,
    );
  }
}

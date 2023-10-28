// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchTasksLoading,
    required TResult Function(String message) fetchTasksError,
    required TResult Function(List<CategoryModel> categories) fetchTasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchTasksLoading,
    TResult? Function(String message)? fetchTasksError,
    TResult? Function(List<CategoryModel> categories)? fetchTasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchTasksLoading,
    TResult Function(String message)? fetchTasksError,
    TResult Function(List<CategoryModel> categories)? fetchTasksSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskStateInitial value) initial,
    required TResult Function(_TaskStateFetchTasksLoading value)
        fetchTasksLoading,
    required TResult Function(_TasksStateFetchTasksError value) fetchTasksError,
    required TResult Function(TaskStateFetchTasksSuccess value)
        fetchTasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskStateInitial value)? initial,
    TResult? Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult? Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult? Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskStateInitial value)? initial,
    TResult Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskStateCopyWith<$Res> {
  factory $TaskStateCopyWith(TaskState value, $Res Function(TaskState) then) =
      _$TaskStateCopyWithImpl<$Res, TaskState>;
}

/// @nodoc
class _$TaskStateCopyWithImpl<$Res, $Val extends TaskState>
    implements $TaskStateCopyWith<$Res> {
  _$TaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$TaskStateInitialImplCopyWith<$Res> {
  factory _$$TaskStateInitialImplCopyWith(_$TaskStateInitialImpl value,
          $Res Function(_$TaskStateInitialImpl) then) =
      __$$TaskStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskStateInitialImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateInitialImpl>
    implements _$$TaskStateInitialImplCopyWith<$Res> {
  __$$TaskStateInitialImplCopyWithImpl(_$TaskStateInitialImpl _value,
      $Res Function(_$TaskStateInitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TaskStateInitialImpl implements _TaskStateInitial {
  const _$TaskStateInitialImpl();

  @override
  String toString() {
    return 'TaskState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TaskStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchTasksLoading,
    required TResult Function(String message) fetchTasksError,
    required TResult Function(List<CategoryModel> categories) fetchTasksSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchTasksLoading,
    TResult? Function(String message)? fetchTasksError,
    TResult? Function(List<CategoryModel> categories)? fetchTasksSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchTasksLoading,
    TResult Function(String message)? fetchTasksError,
    TResult Function(List<CategoryModel> categories)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskStateInitial value) initial,
    required TResult Function(_TaskStateFetchTasksLoading value)
        fetchTasksLoading,
    required TResult Function(_TasksStateFetchTasksError value) fetchTasksError,
    required TResult Function(TaskStateFetchTasksSuccess value)
        fetchTasksSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskStateInitial value)? initial,
    TResult? Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult? Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult? Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskStateInitial value)? initial,
    TResult Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _TaskStateInitial implements TaskState {
  const factory _TaskStateInitial() = _$TaskStateInitialImpl;
}

/// @nodoc
abstract class _$$TaskStateFetchTasksLoadingImplCopyWith<$Res> {
  factory _$$TaskStateFetchTasksLoadingImplCopyWith(
          _$TaskStateFetchTasksLoadingImpl value,
          $Res Function(_$TaskStateFetchTasksLoadingImpl) then) =
      __$$TaskStateFetchTasksLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TaskStateFetchTasksLoadingImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateFetchTasksLoadingImpl>
    implements _$$TaskStateFetchTasksLoadingImplCopyWith<$Res> {
  __$$TaskStateFetchTasksLoadingImplCopyWithImpl(
      _$TaskStateFetchTasksLoadingImpl _value,
      $Res Function(_$TaskStateFetchTasksLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TaskStateFetchTasksLoadingImpl implements _TaskStateFetchTasksLoading {
  const _$TaskStateFetchTasksLoadingImpl();

  @override
  String toString() {
    return 'TaskState.fetchTasksLoading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateFetchTasksLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchTasksLoading,
    required TResult Function(String message) fetchTasksError,
    required TResult Function(List<CategoryModel> categories) fetchTasksSuccess,
  }) {
    return fetchTasksLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchTasksLoading,
    TResult? Function(String message)? fetchTasksError,
    TResult? Function(List<CategoryModel> categories)? fetchTasksSuccess,
  }) {
    return fetchTasksLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchTasksLoading,
    TResult Function(String message)? fetchTasksError,
    TResult Function(List<CategoryModel> categories)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksLoading != null) {
      return fetchTasksLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskStateInitial value) initial,
    required TResult Function(_TaskStateFetchTasksLoading value)
        fetchTasksLoading,
    required TResult Function(_TasksStateFetchTasksError value) fetchTasksError,
    required TResult Function(TaskStateFetchTasksSuccess value)
        fetchTasksSuccess,
  }) {
    return fetchTasksLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskStateInitial value)? initial,
    TResult? Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult? Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult? Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
  }) {
    return fetchTasksLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskStateInitial value)? initial,
    TResult Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksLoading != null) {
      return fetchTasksLoading(this);
    }
    return orElse();
  }
}

abstract class _TaskStateFetchTasksLoading implements TaskState {
  const factory _TaskStateFetchTasksLoading() =
      _$TaskStateFetchTasksLoadingImpl;
}

/// @nodoc
abstract class _$$TasksStateFetchTasksErrorImplCopyWith<$Res> {
  factory _$$TasksStateFetchTasksErrorImplCopyWith(
          _$TasksStateFetchTasksErrorImpl value,
          $Res Function(_$TasksStateFetchTasksErrorImpl) then) =
      __$$TasksStateFetchTasksErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TasksStateFetchTasksErrorImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TasksStateFetchTasksErrorImpl>
    implements _$$TasksStateFetchTasksErrorImplCopyWith<$Res> {
  __$$TasksStateFetchTasksErrorImplCopyWithImpl(
      _$TasksStateFetchTasksErrorImpl _value,
      $Res Function(_$TasksStateFetchTasksErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TasksStateFetchTasksErrorImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TasksStateFetchTasksErrorImpl implements _TasksStateFetchTasksError {
  const _$TasksStateFetchTasksErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TaskState.fetchTasksError(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TasksStateFetchTasksErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TasksStateFetchTasksErrorImplCopyWith<_$TasksStateFetchTasksErrorImpl>
      get copyWith => __$$TasksStateFetchTasksErrorImplCopyWithImpl<
          _$TasksStateFetchTasksErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchTasksLoading,
    required TResult Function(String message) fetchTasksError,
    required TResult Function(List<CategoryModel> categories) fetchTasksSuccess,
  }) {
    return fetchTasksError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchTasksLoading,
    TResult? Function(String message)? fetchTasksError,
    TResult? Function(List<CategoryModel> categories)? fetchTasksSuccess,
  }) {
    return fetchTasksError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchTasksLoading,
    TResult Function(String message)? fetchTasksError,
    TResult Function(List<CategoryModel> categories)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksError != null) {
      return fetchTasksError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskStateInitial value) initial,
    required TResult Function(_TaskStateFetchTasksLoading value)
        fetchTasksLoading,
    required TResult Function(_TasksStateFetchTasksError value) fetchTasksError,
    required TResult Function(TaskStateFetchTasksSuccess value)
        fetchTasksSuccess,
  }) {
    return fetchTasksError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskStateInitial value)? initial,
    TResult? Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult? Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult? Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
  }) {
    return fetchTasksError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskStateInitial value)? initial,
    TResult Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksError != null) {
      return fetchTasksError(this);
    }
    return orElse();
  }
}

abstract class _TasksStateFetchTasksError implements TaskState {
  const factory _TasksStateFetchTasksError({required final String message}) =
      _$TasksStateFetchTasksErrorImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TasksStateFetchTasksErrorImplCopyWith<_$TasksStateFetchTasksErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TaskStateFetchTasksSuccessImplCopyWith<$Res> {
  factory _$$TaskStateFetchTasksSuccessImplCopyWith(
          _$TaskStateFetchTasksSuccessImpl value,
          $Res Function(_$TaskStateFetchTasksSuccessImpl) then) =
      __$$TaskStateFetchTasksSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<CategoryModel> categories});
}

/// @nodoc
class __$$TaskStateFetchTasksSuccessImplCopyWithImpl<$Res>
    extends _$TaskStateCopyWithImpl<$Res, _$TaskStateFetchTasksSuccessImpl>
    implements _$$TaskStateFetchTasksSuccessImplCopyWith<$Res> {
  __$$TaskStateFetchTasksSuccessImplCopyWithImpl(
      _$TaskStateFetchTasksSuccessImpl _value,
      $Res Function(_$TaskStateFetchTasksSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$TaskStateFetchTasksSuccessImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryModel>,
    ));
  }
}

/// @nodoc

class _$TaskStateFetchTasksSuccessImpl implements TaskStateFetchTasksSuccess {
  const _$TaskStateFetchTasksSuccessImpl(final List<CategoryModel> categories)
      : _categories = categories;

  final List<CategoryModel> _categories;
  @override
  List<CategoryModel> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'TaskState.fetchTasksSuccess(categories: $categories)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskStateFetchTasksSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskStateFetchTasksSuccessImplCopyWith<_$TaskStateFetchTasksSuccessImpl>
      get copyWith => __$$TaskStateFetchTasksSuccessImplCopyWithImpl<
          _$TaskStateFetchTasksSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() fetchTasksLoading,
    required TResult Function(String message) fetchTasksError,
    required TResult Function(List<CategoryModel> categories) fetchTasksSuccess,
  }) {
    return fetchTasksSuccess(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? fetchTasksLoading,
    TResult? Function(String message)? fetchTasksError,
    TResult? Function(List<CategoryModel> categories)? fetchTasksSuccess,
  }) {
    return fetchTasksSuccess?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? fetchTasksLoading,
    TResult Function(String message)? fetchTasksError,
    TResult Function(List<CategoryModel> categories)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksSuccess != null) {
      return fetchTasksSuccess(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_TaskStateInitial value) initial,
    required TResult Function(_TaskStateFetchTasksLoading value)
        fetchTasksLoading,
    required TResult Function(_TasksStateFetchTasksError value) fetchTasksError,
    required TResult Function(TaskStateFetchTasksSuccess value)
        fetchTasksSuccess,
  }) {
    return fetchTasksSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_TaskStateInitial value)? initial,
    TResult? Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult? Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult? Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
  }) {
    return fetchTasksSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_TaskStateInitial value)? initial,
    TResult Function(_TaskStateFetchTasksLoading value)? fetchTasksLoading,
    TResult Function(_TasksStateFetchTasksError value)? fetchTasksError,
    TResult Function(TaskStateFetchTasksSuccess value)? fetchTasksSuccess,
    required TResult orElse(),
  }) {
    if (fetchTasksSuccess != null) {
      return fetchTasksSuccess(this);
    }
    return orElse();
  }
}

abstract class TaskStateFetchTasksSuccess implements TaskState {
  const factory TaskStateFetchTasksSuccess(
      final List<CategoryModel> categories) = _$TaskStateFetchTasksSuccessImpl;

  List<CategoryModel> get categories;
  @JsonKey(ignore: true)
  _$$TaskStateFetchTasksSuccessImplCopyWith<_$TaskStateFetchTasksSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

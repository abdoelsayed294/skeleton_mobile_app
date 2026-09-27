// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_by_category_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesByCategoryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByCategoryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesByCategoryState()';
}


}

/// @nodoc
class $ExpensesByCategoryStateCopyWith<$Res>  {
$ExpensesByCategoryStateCopyWith(ExpensesByCategoryState _, $Res Function(ExpensesByCategoryState) __);
}


/// Adds pattern-matching-related methods to [ExpensesByCategoryState].
extension ExpensesByCategoryStatePatterns on ExpensesByCategoryState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpensesByCategoryInitial value)?  initial,TResult Function( ExpensesByCategoryLoading value)?  loading,TResult Function( ExpensesByCategorySuccess value)?  success,TResult Function( ExpensesByCategoryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpensesByCategoryInitial() when initial != null:
return initial(_that);case ExpensesByCategoryLoading() when loading != null:
return loading(_that);case ExpensesByCategorySuccess() when success != null:
return success(_that);case ExpensesByCategoryError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpensesByCategoryInitial value)  initial,required TResult Function( ExpensesByCategoryLoading value)  loading,required TResult Function( ExpensesByCategorySuccess value)  success,required TResult Function( ExpensesByCategoryError value)  error,}){
final _that = this;
switch (_that) {
case ExpensesByCategoryInitial():
return initial(_that);case ExpensesByCategoryLoading():
return loading(_that);case ExpensesByCategorySuccess():
return success(_that);case ExpensesByCategoryError():
return error(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpensesByCategoryInitial value)?  initial,TResult? Function( ExpensesByCategoryLoading value)?  loading,TResult? Function( ExpensesByCategorySuccess value)?  success,TResult? Function( ExpensesByCategoryError value)?  error,}){
final _that = this;
switch (_that) {
case ExpensesByCategoryInitial() when initial != null:
return initial(_that);case ExpensesByCategoryLoading() when loading != null:
return loading(_that);case ExpensesByCategorySuccess() when success != null:
return success(_that);case ExpensesByCategoryError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExpensesByCategory data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpensesByCategoryInitial() when initial != null:
return initial();case ExpensesByCategoryLoading() when loading != null:
return loading();case ExpensesByCategorySuccess() when success != null:
return success(_that.data);case ExpensesByCategoryError() when error != null:
return error(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExpensesByCategory data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case ExpensesByCategoryInitial():
return initial();case ExpensesByCategoryLoading():
return loading();case ExpensesByCategorySuccess():
return success(_that.data);case ExpensesByCategoryError():
return error(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExpensesByCategory data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case ExpensesByCategoryInitial() when initial != null:
return initial();case ExpensesByCategoryLoading() when loading != null:
return loading();case ExpensesByCategorySuccess() when success != null:
return success(_that.data);case ExpensesByCategoryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExpensesByCategoryInitial implements ExpensesByCategoryState {
  const ExpensesByCategoryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByCategoryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesByCategoryState.initial()';
}


}




/// @nodoc


class ExpensesByCategoryLoading implements ExpensesByCategoryState {
  const ExpensesByCategoryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByCategoryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesByCategoryState.loading()';
}


}




/// @nodoc


class ExpensesByCategorySuccess implements ExpensesByCategoryState {
  const ExpensesByCategorySuccess(this.data);
  

 final  ExpensesByCategory data;

/// Create a copy of ExpensesByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesByCategorySuccessCopyWith<ExpensesByCategorySuccess> get copyWith => _$ExpensesByCategorySuccessCopyWithImpl<ExpensesByCategorySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByCategorySuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ExpensesByCategoryState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ExpensesByCategorySuccessCopyWith<$Res> implements $ExpensesByCategoryStateCopyWith<$Res> {
  factory $ExpensesByCategorySuccessCopyWith(ExpensesByCategorySuccess value, $Res Function(ExpensesByCategorySuccess) _then) = _$ExpensesByCategorySuccessCopyWithImpl;
@useResult
$Res call({
 ExpensesByCategory data
});




}
/// @nodoc
class _$ExpensesByCategorySuccessCopyWithImpl<$Res>
    implements $ExpensesByCategorySuccessCopyWith<$Res> {
  _$ExpensesByCategorySuccessCopyWithImpl(this._self, this._then);

  final ExpensesByCategorySuccess _self;
  final $Res Function(ExpensesByCategorySuccess) _then;

/// Create a copy of ExpensesByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ExpensesByCategorySuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExpensesByCategory,
  ));
}


}

/// @nodoc


class ExpensesByCategoryError implements ExpensesByCategoryState {
  const ExpensesByCategoryError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of ExpensesByCategoryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesByCategoryErrorCopyWith<ExpensesByCategoryError> get copyWith => _$ExpensesByCategoryErrorCopyWithImpl<ExpensesByCategoryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesByCategoryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExpensesByCategoryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesByCategoryErrorCopyWith<$Res> implements $ExpensesByCategoryStateCopyWith<$Res> {
  factory $ExpensesByCategoryErrorCopyWith(ExpensesByCategoryError value, $Res Function(ExpensesByCategoryError) _then) = _$ExpensesByCategoryErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ExpensesByCategoryErrorCopyWithImpl<$Res>
    implements $ExpensesByCategoryErrorCopyWith<$Res> {
  _$ExpensesByCategoryErrorCopyWithImpl(this._self, this._then);

  final ExpensesByCategoryError _self;
  final $Res Function(ExpensesByCategoryError) _then;

/// Create a copy of ExpensesByCategoryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExpensesByCategoryError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

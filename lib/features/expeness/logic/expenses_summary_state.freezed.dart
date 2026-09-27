// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_summary_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesSummaryState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummaryState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesSummaryState()';
}


}

/// @nodoc
class $ExpensesSummaryStateCopyWith<$Res>  {
$ExpensesSummaryStateCopyWith(ExpensesSummaryState _, $Res Function(ExpensesSummaryState) __);
}


/// Adds pattern-matching-related methods to [ExpensesSummaryState].
extension ExpensesSummaryStatePatterns on ExpensesSummaryState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpensesSummaryInitial value)?  initial,TResult Function( ExpensesSummaryLoading value)?  loading,TResult Function( ExpensesSummarySuccess value)?  success,TResult Function( ExpensesSummaryError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpensesSummaryInitial() when initial != null:
return initial(_that);case ExpensesSummaryLoading() when loading != null:
return loading(_that);case ExpensesSummarySuccess() when success != null:
return success(_that);case ExpensesSummaryError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpensesSummaryInitial value)  initial,required TResult Function( ExpensesSummaryLoading value)  loading,required TResult Function( ExpensesSummarySuccess value)  success,required TResult Function( ExpensesSummaryError value)  error,}){
final _that = this;
switch (_that) {
case ExpensesSummaryInitial():
return initial(_that);case ExpensesSummaryLoading():
return loading(_that);case ExpensesSummarySuccess():
return success(_that);case ExpensesSummaryError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpensesSummaryInitial value)?  initial,TResult? Function( ExpensesSummaryLoading value)?  loading,TResult? Function( ExpensesSummarySuccess value)?  success,TResult? Function( ExpensesSummaryError value)?  error,}){
final _that = this;
switch (_that) {
case ExpensesSummaryInitial() when initial != null:
return initial(_that);case ExpensesSummaryLoading() when loading != null:
return loading(_that);case ExpensesSummarySuccess() when success != null:
return success(_that);case ExpensesSummaryError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExpensesSummary data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpensesSummaryInitial() when initial != null:
return initial();case ExpensesSummaryLoading() when loading != null:
return loading();case ExpensesSummarySuccess() when success != null:
return success(_that.data);case ExpensesSummaryError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExpensesSummary data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case ExpensesSummaryInitial():
return initial();case ExpensesSummaryLoading():
return loading();case ExpensesSummarySuccess():
return success(_that.data);case ExpensesSummaryError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExpensesSummary data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case ExpensesSummaryInitial() when initial != null:
return initial();case ExpensesSummaryLoading() when loading != null:
return loading();case ExpensesSummarySuccess() when success != null:
return success(_that.data);case ExpensesSummaryError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExpensesSummaryInitial implements ExpensesSummaryState {
  const ExpensesSummaryInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummaryInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesSummaryState.initial()';
}


}




/// @nodoc


class ExpensesSummaryLoading implements ExpensesSummaryState {
  const ExpensesSummaryLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummaryLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesSummaryState.loading()';
}


}




/// @nodoc


class ExpensesSummarySuccess implements ExpensesSummaryState {
  const ExpensesSummarySuccess(this.data);
  

 final  ExpensesSummary data;

/// Create a copy of ExpensesSummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesSummarySuccessCopyWith<ExpensesSummarySuccess> get copyWith => _$ExpensesSummarySuccessCopyWithImpl<ExpensesSummarySuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummarySuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ExpensesSummaryState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ExpensesSummarySuccessCopyWith<$Res> implements $ExpensesSummaryStateCopyWith<$Res> {
  factory $ExpensesSummarySuccessCopyWith(ExpensesSummarySuccess value, $Res Function(ExpensesSummarySuccess) _then) = _$ExpensesSummarySuccessCopyWithImpl;
@useResult
$Res call({
 ExpensesSummary data
});




}
/// @nodoc
class _$ExpensesSummarySuccessCopyWithImpl<$Res>
    implements $ExpensesSummarySuccessCopyWith<$Res> {
  _$ExpensesSummarySuccessCopyWithImpl(this._self, this._then);

  final ExpensesSummarySuccess _self;
  final $Res Function(ExpensesSummarySuccess) _then;

/// Create a copy of ExpensesSummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ExpensesSummarySuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExpensesSummary,
  ));
}


}

/// @nodoc


class ExpensesSummaryError implements ExpensesSummaryState {
  const ExpensesSummaryError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of ExpensesSummaryState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesSummaryErrorCopyWith<ExpensesSummaryError> get copyWith => _$ExpensesSummaryErrorCopyWithImpl<ExpensesSummaryError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesSummaryError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExpensesSummaryState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesSummaryErrorCopyWith<$Res> implements $ExpensesSummaryStateCopyWith<$Res> {
  factory $ExpensesSummaryErrorCopyWith(ExpensesSummaryError value, $Res Function(ExpensesSummaryError) _then) = _$ExpensesSummaryErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ExpensesSummaryErrorCopyWithImpl<$Res>
    implements $ExpensesSummaryErrorCopyWith<$Res> {
  _$ExpensesSummaryErrorCopyWithImpl(this._self, this._then);

  final ExpensesSummaryError _self;
  final $Res Function(ExpensesSummaryError) _then;

/// Create a copy of ExpensesSummaryState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExpensesSummaryError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

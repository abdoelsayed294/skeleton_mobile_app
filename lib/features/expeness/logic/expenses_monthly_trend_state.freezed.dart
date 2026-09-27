// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_monthly_trend_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesMonthlyTrendState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesMonthlyTrendState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesMonthlyTrendState()';
}


}

/// @nodoc
class $ExpensesMonthlyTrendStateCopyWith<$Res>  {
$ExpensesMonthlyTrendStateCopyWith(ExpensesMonthlyTrendState _, $Res Function(ExpensesMonthlyTrendState) __);
}


/// Adds pattern-matching-related methods to [ExpensesMonthlyTrendState].
extension ExpensesMonthlyTrendStatePatterns on ExpensesMonthlyTrendState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpensesMonthlyTrendInitial value)?  initial,TResult Function( ExpensesMonthlyTrendLoading value)?  loading,TResult Function( ExpensesMonthlyTrendSuccess value)?  success,TResult Function( ExpensesMonthlyTrendError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial() when initial != null:
return initial(_that);case ExpensesMonthlyTrendLoading() when loading != null:
return loading(_that);case ExpensesMonthlyTrendSuccess() when success != null:
return success(_that);case ExpensesMonthlyTrendError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpensesMonthlyTrendInitial value)  initial,required TResult Function( ExpensesMonthlyTrendLoading value)  loading,required TResult Function( ExpensesMonthlyTrendSuccess value)  success,required TResult Function( ExpensesMonthlyTrendError value)  error,}){
final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial():
return initial(_that);case ExpensesMonthlyTrendLoading():
return loading(_that);case ExpensesMonthlyTrendSuccess():
return success(_that);case ExpensesMonthlyTrendError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpensesMonthlyTrendInitial value)?  initial,TResult? Function( ExpensesMonthlyTrendLoading value)?  loading,TResult? Function( ExpensesMonthlyTrendSuccess value)?  success,TResult? Function( ExpensesMonthlyTrendError value)?  error,}){
final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial() when initial != null:
return initial(_that);case ExpensesMonthlyTrendLoading() when loading != null:
return loading(_that);case ExpensesMonthlyTrendSuccess() when success != null:
return success(_that);case ExpensesMonthlyTrendError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExpensesMonthlyTrend data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial() when initial != null:
return initial();case ExpensesMonthlyTrendLoading() when loading != null:
return loading();case ExpensesMonthlyTrendSuccess() when success != null:
return success(_that.data);case ExpensesMonthlyTrendError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExpensesMonthlyTrend data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial():
return initial();case ExpensesMonthlyTrendLoading():
return loading();case ExpensesMonthlyTrendSuccess():
return success(_that.data);case ExpensesMonthlyTrendError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExpensesMonthlyTrend data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case ExpensesMonthlyTrendInitial() when initial != null:
return initial();case ExpensesMonthlyTrendLoading() when loading != null:
return loading();case ExpensesMonthlyTrendSuccess() when success != null:
return success(_that.data);case ExpensesMonthlyTrendError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExpensesMonthlyTrendInitial implements ExpensesMonthlyTrendState {
  const ExpensesMonthlyTrendInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesMonthlyTrendInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesMonthlyTrendState.initial()';
}


}




/// @nodoc


class ExpensesMonthlyTrendLoading implements ExpensesMonthlyTrendState {
  const ExpensesMonthlyTrendLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesMonthlyTrendLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesMonthlyTrendState.loading()';
}


}




/// @nodoc


class ExpensesMonthlyTrendSuccess implements ExpensesMonthlyTrendState {
  const ExpensesMonthlyTrendSuccess(this.data);
  

 final  ExpensesMonthlyTrend data;

/// Create a copy of ExpensesMonthlyTrendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesMonthlyTrendSuccessCopyWith<ExpensesMonthlyTrendSuccess> get copyWith => _$ExpensesMonthlyTrendSuccessCopyWithImpl<ExpensesMonthlyTrendSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesMonthlyTrendSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ExpensesMonthlyTrendState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ExpensesMonthlyTrendSuccessCopyWith<$Res> implements $ExpensesMonthlyTrendStateCopyWith<$Res> {
  factory $ExpensesMonthlyTrendSuccessCopyWith(ExpensesMonthlyTrendSuccess value, $Res Function(ExpensesMonthlyTrendSuccess) _then) = _$ExpensesMonthlyTrendSuccessCopyWithImpl;
@useResult
$Res call({
 ExpensesMonthlyTrend data
});




}
/// @nodoc
class _$ExpensesMonthlyTrendSuccessCopyWithImpl<$Res>
    implements $ExpensesMonthlyTrendSuccessCopyWith<$Res> {
  _$ExpensesMonthlyTrendSuccessCopyWithImpl(this._self, this._then);

  final ExpensesMonthlyTrendSuccess _self;
  final $Res Function(ExpensesMonthlyTrendSuccess) _then;

/// Create a copy of ExpensesMonthlyTrendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ExpensesMonthlyTrendSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExpensesMonthlyTrend,
  ));
}


}

/// @nodoc


class ExpensesMonthlyTrendError implements ExpensesMonthlyTrendState {
  const ExpensesMonthlyTrendError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of ExpensesMonthlyTrendState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesMonthlyTrendErrorCopyWith<ExpensesMonthlyTrendError> get copyWith => _$ExpensesMonthlyTrendErrorCopyWithImpl<ExpensesMonthlyTrendError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesMonthlyTrendError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExpensesMonthlyTrendState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesMonthlyTrendErrorCopyWith<$Res> implements $ExpensesMonthlyTrendStateCopyWith<$Res> {
  factory $ExpensesMonthlyTrendErrorCopyWith(ExpensesMonthlyTrendError value, $Res Function(ExpensesMonthlyTrendError) _then) = _$ExpensesMonthlyTrendErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ExpensesMonthlyTrendErrorCopyWithImpl<$Res>
    implements $ExpensesMonthlyTrendErrorCopyWith<$Res> {
  _$ExpensesMonthlyTrendErrorCopyWithImpl(this._self, this._then);

  final ExpensesMonthlyTrendError _self;
  final $Res Function(ExpensesMonthlyTrendError) _then;

/// Create a copy of ExpensesMonthlyTrendState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExpensesMonthlyTrendError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

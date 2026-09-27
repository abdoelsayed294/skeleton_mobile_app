// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_peak_days_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesPeakDaysState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesPeakDaysState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesPeakDaysState()';
}


}

/// @nodoc
class $ExpensesPeakDaysStateCopyWith<$Res>  {
$ExpensesPeakDaysStateCopyWith(ExpensesPeakDaysState _, $Res Function(ExpensesPeakDaysState) __);
}


/// Adds pattern-matching-related methods to [ExpensesPeakDaysState].
extension ExpensesPeakDaysStatePatterns on ExpensesPeakDaysState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpensesPeakDaysInitial value)?  initial,TResult Function( ExpensesPeakDaysLoading value)?  loading,TResult Function( ExpensesPeakDaysSuccess value)?  success,TResult Function( ExpensesPeakDaysError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial() when initial != null:
return initial(_that);case ExpensesPeakDaysLoading() when loading != null:
return loading(_that);case ExpensesPeakDaysSuccess() when success != null:
return success(_that);case ExpensesPeakDaysError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpensesPeakDaysInitial value)  initial,required TResult Function( ExpensesPeakDaysLoading value)  loading,required TResult Function( ExpensesPeakDaysSuccess value)  success,required TResult Function( ExpensesPeakDaysError value)  error,}){
final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial():
return initial(_that);case ExpensesPeakDaysLoading():
return loading(_that);case ExpensesPeakDaysSuccess():
return success(_that);case ExpensesPeakDaysError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpensesPeakDaysInitial value)?  initial,TResult? Function( ExpensesPeakDaysLoading value)?  loading,TResult? Function( ExpensesPeakDaysSuccess value)?  success,TResult? Function( ExpensesPeakDaysError value)?  error,}){
final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial() when initial != null:
return initial(_that);case ExpensesPeakDaysLoading() when loading != null:
return loading(_that);case ExpensesPeakDaysSuccess() when success != null:
return success(_that);case ExpensesPeakDaysError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExpensesPeakDays data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial() when initial != null:
return initial();case ExpensesPeakDaysLoading() when loading != null:
return loading();case ExpensesPeakDaysSuccess() when success != null:
return success(_that.data);case ExpensesPeakDaysError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExpensesPeakDays data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial():
return initial();case ExpensesPeakDaysLoading():
return loading();case ExpensesPeakDaysSuccess():
return success(_that.data);case ExpensesPeakDaysError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExpensesPeakDays data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case ExpensesPeakDaysInitial() when initial != null:
return initial();case ExpensesPeakDaysLoading() when loading != null:
return loading();case ExpensesPeakDaysSuccess() when success != null:
return success(_that.data);case ExpensesPeakDaysError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExpensesPeakDaysInitial implements ExpensesPeakDaysState {
  const ExpensesPeakDaysInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesPeakDaysInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesPeakDaysState.initial()';
}


}




/// @nodoc


class ExpensesPeakDaysLoading implements ExpensesPeakDaysState {
  const ExpensesPeakDaysLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesPeakDaysLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesPeakDaysState.loading()';
}


}




/// @nodoc


class ExpensesPeakDaysSuccess implements ExpensesPeakDaysState {
  const ExpensesPeakDaysSuccess(this.data);
  

 final  ExpensesPeakDays data;

/// Create a copy of ExpensesPeakDaysState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesPeakDaysSuccessCopyWith<ExpensesPeakDaysSuccess> get copyWith => _$ExpensesPeakDaysSuccessCopyWithImpl<ExpensesPeakDaysSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesPeakDaysSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ExpensesPeakDaysState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ExpensesPeakDaysSuccessCopyWith<$Res> implements $ExpensesPeakDaysStateCopyWith<$Res> {
  factory $ExpensesPeakDaysSuccessCopyWith(ExpensesPeakDaysSuccess value, $Res Function(ExpensesPeakDaysSuccess) _then) = _$ExpensesPeakDaysSuccessCopyWithImpl;
@useResult
$Res call({
 ExpensesPeakDays data
});




}
/// @nodoc
class _$ExpensesPeakDaysSuccessCopyWithImpl<$Res>
    implements $ExpensesPeakDaysSuccessCopyWith<$Res> {
  _$ExpensesPeakDaysSuccessCopyWithImpl(this._self, this._then);

  final ExpensesPeakDaysSuccess _self;
  final $Res Function(ExpensesPeakDaysSuccess) _then;

/// Create a copy of ExpensesPeakDaysState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ExpensesPeakDaysSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExpensesPeakDays,
  ));
}


}

/// @nodoc


class ExpensesPeakDaysError implements ExpensesPeakDaysState {
  const ExpensesPeakDaysError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of ExpensesPeakDaysState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesPeakDaysErrorCopyWith<ExpensesPeakDaysError> get copyWith => _$ExpensesPeakDaysErrorCopyWithImpl<ExpensesPeakDaysError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesPeakDaysError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExpensesPeakDaysState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesPeakDaysErrorCopyWith<$Res> implements $ExpensesPeakDaysStateCopyWith<$Res> {
  factory $ExpensesPeakDaysErrorCopyWith(ExpensesPeakDaysError value, $Res Function(ExpensesPeakDaysError) _then) = _$ExpensesPeakDaysErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ExpensesPeakDaysErrorCopyWithImpl<$Res>
    implements $ExpensesPeakDaysErrorCopyWith<$Res> {
  _$ExpensesPeakDaysErrorCopyWithImpl(this._self, this._then);

  final ExpensesPeakDaysError _self;
  final $Res Function(ExpensesPeakDaysError) _then;

/// Create a copy of ExpensesPeakDaysState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExpensesPeakDaysError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

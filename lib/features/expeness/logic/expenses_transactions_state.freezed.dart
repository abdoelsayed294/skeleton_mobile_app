// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_transactions_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ExpensesTransactionsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesTransactionsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesTransactionsState()';
}


}

/// @nodoc
class $ExpensesTransactionsStateCopyWith<$Res>  {
$ExpensesTransactionsStateCopyWith(ExpensesTransactionsState _, $Res Function(ExpensesTransactionsState) __);
}


/// Adds pattern-matching-related methods to [ExpensesTransactionsState].
extension ExpensesTransactionsStatePatterns on ExpensesTransactionsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ExpensesTransactionsInitial value)?  initial,TResult Function( ExpensesTransactionsLoading value)?  loading,TResult Function( ExpensesTransactionsSuccess value)?  success,TResult Function( ExpensesTransactionsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ExpensesTransactionsInitial() when initial != null:
return initial(_that);case ExpensesTransactionsLoading() when loading != null:
return loading(_that);case ExpensesTransactionsSuccess() when success != null:
return success(_that);case ExpensesTransactionsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ExpensesTransactionsInitial value)  initial,required TResult Function( ExpensesTransactionsLoading value)  loading,required TResult Function( ExpensesTransactionsSuccess value)  success,required TResult Function( ExpensesTransactionsError value)  error,}){
final _that = this;
switch (_that) {
case ExpensesTransactionsInitial():
return initial(_that);case ExpensesTransactionsLoading():
return loading(_that);case ExpensesTransactionsSuccess():
return success(_that);case ExpensesTransactionsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ExpensesTransactionsInitial value)?  initial,TResult? Function( ExpensesTransactionsLoading value)?  loading,TResult? Function( ExpensesTransactionsSuccess value)?  success,TResult? Function( ExpensesTransactionsError value)?  error,}){
final _that = this;
switch (_that) {
case ExpensesTransactionsInitial() when initial != null:
return initial(_that);case ExpensesTransactionsLoading() when loading != null:
return loading(_that);case ExpensesTransactionsSuccess() when success != null:
return success(_that);case ExpensesTransactionsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( ExpensesTransactions data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ExpensesTransactionsInitial() when initial != null:
return initial();case ExpensesTransactionsLoading() when loading != null:
return loading();case ExpensesTransactionsSuccess() when success != null:
return success(_that.data);case ExpensesTransactionsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( ExpensesTransactions data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case ExpensesTransactionsInitial():
return initial();case ExpensesTransactionsLoading():
return loading();case ExpensesTransactionsSuccess():
return success(_that.data);case ExpensesTransactionsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( ExpensesTransactions data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case ExpensesTransactionsInitial() when initial != null:
return initial();case ExpensesTransactionsLoading() when loading != null:
return loading();case ExpensesTransactionsSuccess() when success != null:
return success(_that.data);case ExpensesTransactionsError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class ExpensesTransactionsInitial implements ExpensesTransactionsState {
  const ExpensesTransactionsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesTransactionsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesTransactionsState.initial()';
}


}




/// @nodoc


class ExpensesTransactionsLoading implements ExpensesTransactionsState {
  const ExpensesTransactionsLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesTransactionsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ExpensesTransactionsState.loading()';
}


}




/// @nodoc


class ExpensesTransactionsSuccess implements ExpensesTransactionsState {
  const ExpensesTransactionsSuccess(this.data);
  

 final  ExpensesTransactions data;

/// Create a copy of ExpensesTransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesTransactionsSuccessCopyWith<ExpensesTransactionsSuccess> get copyWith => _$ExpensesTransactionsSuccessCopyWithImpl<ExpensesTransactionsSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesTransactionsSuccess&&(identical(other.data, data) || other.data == data));
}


@override
int get hashCode => Object.hash(runtimeType,data);

@override
String toString() {
  return 'ExpensesTransactionsState.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $ExpensesTransactionsSuccessCopyWith<$Res> implements $ExpensesTransactionsStateCopyWith<$Res> {
  factory $ExpensesTransactionsSuccessCopyWith(ExpensesTransactionsSuccess value, $Res Function(ExpensesTransactionsSuccess) _then) = _$ExpensesTransactionsSuccessCopyWithImpl;
@useResult
$Res call({
 ExpensesTransactions data
});




}
/// @nodoc
class _$ExpensesTransactionsSuccessCopyWithImpl<$Res>
    implements $ExpensesTransactionsSuccessCopyWith<$Res> {
  _$ExpensesTransactionsSuccessCopyWithImpl(this._self, this._then);

  final ExpensesTransactionsSuccess _self;
  final $Res Function(ExpensesTransactionsSuccess) _then;

/// Create a copy of ExpensesTransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = null,}) {
  return _then(ExpensesTransactionsSuccess(
null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as ExpensesTransactions,
  ));
}


}

/// @nodoc


class ExpensesTransactionsError implements ExpensesTransactionsState {
  const ExpensesTransactionsError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of ExpensesTransactionsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpensesTransactionsErrorCopyWith<ExpensesTransactionsError> get copyWith => _$ExpensesTransactionsErrorCopyWithImpl<ExpensesTransactionsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpensesTransactionsError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'ExpensesTransactionsState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ExpensesTransactionsErrorCopyWith<$Res> implements $ExpensesTransactionsStateCopyWith<$Res> {
  factory $ExpensesTransactionsErrorCopyWith(ExpensesTransactionsError value, $Res Function(ExpensesTransactionsError) _then) = _$ExpensesTransactionsErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ExpensesTransactionsErrorCopyWithImpl<$Res>
    implements $ExpensesTransactionsErrorCopyWith<$Res> {
  _$ExpensesTransactionsErrorCopyWithImpl(this._self, this._then);

  final ExpensesTransactionsError _self;
  final $Res Function(ExpensesTransactionsError) _then;

/// Create a copy of ExpensesTransactionsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(ExpensesTransactionsError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

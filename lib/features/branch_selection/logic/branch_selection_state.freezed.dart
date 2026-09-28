// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'branch_selection_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BranchSelectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BranchSelectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BranchSelectionState()';
}


}

/// @nodoc
class $BranchSelectionStateCopyWith<$Res>  {
$BranchSelectionStateCopyWith(BranchSelectionState _, $Res Function(BranchSelectionState) __);
}


/// Adds pattern-matching-related methods to [BranchSelectionState].
extension BranchSelectionStatePatterns on BranchSelectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Initial value)?  initial,TResult Function( Selected value)?  selected,TResult Function( Saving value)?  saving,TResult Function( Completed value)?  completed,TResult Function( LoggingOut value)?  loggingOut,TResult Function( LoggedOut value)?  loggedOut,TResult Function( Error value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Selected() when selected != null:
return selected(_that);case Saving() when saving != null:
return saving(_that);case Completed() when completed != null:
return completed(_that);case LoggingOut() when loggingOut != null:
return loggingOut(_that);case LoggedOut() when loggedOut != null:
return loggedOut(_that);case Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Initial value)  initial,required TResult Function( Selected value)  selected,required TResult Function( Saving value)  saving,required TResult Function( Completed value)  completed,required TResult Function( LoggingOut value)  loggingOut,required TResult Function( LoggedOut value)  loggedOut,required TResult Function( Error value)  error,}){
final _that = this;
switch (_that) {
case _Initial():
return initial(_that);case Selected():
return selected(_that);case Saving():
return saving(_that);case Completed():
return completed(_that);case LoggingOut():
return loggingOut(_that);case LoggedOut():
return loggedOut(_that);case Error():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Initial value)?  initial,TResult? Function( Selected value)?  selected,TResult? Function( Saving value)?  saving,TResult? Function( Completed value)?  completed,TResult? Function( LoggingOut value)?  loggingOut,TResult? Function( LoggedOut value)?  loggedOut,TResult? Function( Error value)?  error,}){
final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial(_that);case Selected() when selected != null:
return selected(_that);case Saving() when saving != null:
return saving(_that);case Completed() when completed != null:
return completed(_that);case LoggingOut() when loggingOut != null:
return loggingOut(_that);case LoggedOut() when loggedOut != null:
return loggedOut(_that);case Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( Branch branch)?  selected,TResult Function( Branch branch)?  saving,TResult Function()?  completed,TResult Function()?  loggingOut,TResult Function()?  loggedOut,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Selected() when selected != null:
return selected(_that.branch);case Saving() when saving != null:
return saving(_that.branch);case Completed() when completed != null:
return completed();case LoggingOut() when loggingOut != null:
return loggingOut();case LoggedOut() when loggedOut != null:
return loggedOut();case Error() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( Branch branch)  selected,required TResult Function( Branch branch)  saving,required TResult Function()  completed,required TResult Function()  loggingOut,required TResult Function()  loggedOut,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case _Initial():
return initial();case Selected():
return selected(_that.branch);case Saving():
return saving(_that.branch);case Completed():
return completed();case LoggingOut():
return loggingOut();case LoggedOut():
return loggedOut();case Error():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( Branch branch)?  selected,TResult? Function( Branch branch)?  saving,TResult? Function()?  completed,TResult? Function()?  loggingOut,TResult? Function()?  loggedOut,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case _Initial() when initial != null:
return initial();case Selected() when selected != null:
return selected(_that.branch);case Saving() when saving != null:
return saving(_that.branch);case Completed() when completed != null:
return completed();case LoggingOut() when loggingOut != null:
return loggingOut();case LoggedOut() when loggedOut != null:
return loggedOut();case Error() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _Initial implements BranchSelectionState {
  const _Initial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Initial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BranchSelectionState.initial()';
}


}




/// @nodoc


class Selected implements BranchSelectionState {
  const Selected(this.branch);
  

 final  Branch branch;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedCopyWith<Selected> get copyWith => _$SelectedCopyWithImpl<Selected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Selected&&(identical(other.branch, branch) || other.branch == branch));
}


@override
int get hashCode => Object.hash(runtimeType,branch);

@override
String toString() {
  return 'BranchSelectionState.selected(branch: $branch)';
}


}

/// @nodoc
abstract mixin class $SelectedCopyWith<$Res> implements $BranchSelectionStateCopyWith<$Res> {
  factory $SelectedCopyWith(Selected value, $Res Function(Selected) _then) = _$SelectedCopyWithImpl;
@useResult
$Res call({
 Branch branch
});




}
/// @nodoc
class _$SelectedCopyWithImpl<$Res>
    implements $SelectedCopyWith<$Res> {
  _$SelectedCopyWithImpl(this._self, this._then);

  final Selected _self;
  final $Res Function(Selected) _then;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? branch = null,}) {
  return _then(Selected(
null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch,
  ));
}


}

/// @nodoc


class Saving implements BranchSelectionState {
  const Saving(this.branch);
  

 final  Branch branch;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SavingCopyWith<Saving> get copyWith => _$SavingCopyWithImpl<Saving>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Saving&&(identical(other.branch, branch) || other.branch == branch));
}


@override
int get hashCode => Object.hash(runtimeType,branch);

@override
String toString() {
  return 'BranchSelectionState.saving(branch: $branch)';
}


}

/// @nodoc
abstract mixin class $SavingCopyWith<$Res> implements $BranchSelectionStateCopyWith<$Res> {
  factory $SavingCopyWith(Saving value, $Res Function(Saving) _then) = _$SavingCopyWithImpl;
@useResult
$Res call({
 Branch branch
});




}
/// @nodoc
class _$SavingCopyWithImpl<$Res>
    implements $SavingCopyWith<$Res> {
  _$SavingCopyWithImpl(this._self, this._then);

  final Saving _self;
  final $Res Function(Saving) _then;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? branch = null,}) {
  return _then(Saving(
null == branch ? _self.branch : branch // ignore: cast_nullable_to_non_nullable
as Branch,
  ));
}


}

/// @nodoc


class Completed implements BranchSelectionState {
  const Completed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Completed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BranchSelectionState.completed()';
}


}




/// @nodoc


class LoggingOut implements BranchSelectionState {
  const LoggingOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggingOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BranchSelectionState.loggingOut()';
}


}




/// @nodoc


class LoggedOut implements BranchSelectionState {
  const LoggedOut();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoggedOut);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BranchSelectionState.loggedOut()';
}


}




/// @nodoc


class Error implements BranchSelectionState {
  const Error(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ErrorCopyWith<Error> get copyWith => _$ErrorCopyWithImpl<Error>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Error&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'BranchSelectionState.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res> implements $BranchSelectionStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) = _$ErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$ErrorCopyWithImpl<$Res>
    implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

/// Create a copy of BranchSelectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(Error(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

// dart format on

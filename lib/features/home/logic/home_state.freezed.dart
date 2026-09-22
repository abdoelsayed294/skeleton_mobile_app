// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$RequestState<T> implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestState<$T>'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestState<$T>()';
}


}

/// @nodoc
class $RequestStateCopyWith<T,$Res>  {
$RequestStateCopyWith(RequestState<T> _, $Res Function(RequestState<T>) __);
}


/// Adds pattern-matching-related methods to [RequestState].
extension RequestStatePatterns<T> on RequestState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( RequestInitial<T> value)?  initial,TResult Function( RequestLoading<T> value)?  loading,TResult Function( RequestSuccess<T> value)?  success,TResult Function( RequestError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case RequestInitial() when initial != null:
return initial(_that);case RequestLoading() when loading != null:
return loading(_that);case RequestSuccess() when success != null:
return success(_that);case RequestError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( RequestInitial<T> value)  initial,required TResult Function( RequestLoading<T> value)  loading,required TResult Function( RequestSuccess<T> value)  success,required TResult Function( RequestError<T> value)  error,}){
final _that = this;
switch (_that) {
case RequestInitial():
return initial(_that);case RequestLoading():
return loading(_that);case RequestSuccess():
return success(_that);case RequestError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( RequestInitial<T> value)?  initial,TResult? Function( RequestLoading<T> value)?  loading,TResult? Function( RequestSuccess<T> value)?  success,TResult? Function( RequestError<T> value)?  error,}){
final _that = this;
switch (_that) {
case RequestInitial() when initial != null:
return initial(_that);case RequestLoading() when loading != null:
return loading(_that);case RequestSuccess() when success != null:
return success(_that);case RequestError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  success,TResult Function( ApiErrorModel error)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case RequestInitial() when initial != null:
return initial();case RequestLoading() when loading != null:
return loading();case RequestSuccess() when success != null:
return success(_that.data);case RequestError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  success,required TResult Function( ApiErrorModel error)  error,}) {final _that = this;
switch (_that) {
case RequestInitial():
return initial();case RequestLoading():
return loading();case RequestSuccess():
return success(_that.data);case RequestError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  success,TResult? Function( ApiErrorModel error)?  error,}) {final _that = this;
switch (_that) {
case RequestInitial() when initial != null:
return initial();case RequestLoading() when loading != null:
return loading();case RequestSuccess() when success != null:
return success(_that.data);case RequestError() when error != null:
return error(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class RequestInitial<T> with DiagnosticableTreeMixin implements RequestState<T> {
  const RequestInitial();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestState<$T>.initial'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestState<$T>.initial()';
}


}




/// @nodoc


class RequestLoading<T> with DiagnosticableTreeMixin implements RequestState<T> {
  const RequestLoading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestState<$T>.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestState<$T>.loading()';
}


}




/// @nodoc


class RequestSuccess<T> with DiagnosticableTreeMixin implements RequestState<T> {
  const RequestSuccess(this.data);
  

 final  T data;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestSuccessCopyWith<T, RequestSuccess<T>> get copyWith => _$RequestSuccessCopyWithImpl<T, RequestSuccess<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestState<$T>.success'))
    ..add(DiagnosticsProperty('data', data));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestSuccess<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestState<$T>.success(data: $data)';
}


}

/// @nodoc
abstract mixin class $RequestSuccessCopyWith<T,$Res> implements $RequestStateCopyWith<T, $Res> {
  factory $RequestSuccessCopyWith(RequestSuccess<T> value, $Res Function(RequestSuccess<T>) _then) = _$RequestSuccessCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$RequestSuccessCopyWithImpl<T,$Res>
    implements $RequestSuccessCopyWith<T, $Res> {
  _$RequestSuccessCopyWithImpl(this._self, this._then);

  final RequestSuccess<T> _self;
  final $Res Function(RequestSuccess<T>) _then;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(RequestSuccess<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class RequestError<T> with DiagnosticableTreeMixin implements RequestState<T> {
  const RequestError(this.error);
  

 final  ApiErrorModel error;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RequestErrorCopyWith<T, RequestError<T>> get copyWith => _$RequestErrorCopyWithImpl<T, RequestError<T>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'RequestState<$T>.error'))
    ..add(DiagnosticsProperty('error', error));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RequestError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'RequestState<$T>.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $RequestErrorCopyWith<T,$Res> implements $RequestStateCopyWith<T, $Res> {
  factory $RequestErrorCopyWith(RequestError<T> value, $Res Function(RequestError<T>) _then) = _$RequestErrorCopyWithImpl;
@useResult
$Res call({
 ApiErrorModel error
});




}
/// @nodoc
class _$RequestErrorCopyWithImpl<T,$Res>
    implements $RequestErrorCopyWith<T, $Res> {
  _$RequestErrorCopyWithImpl(this._self, this._then);

  final RequestError<T> _self;
  final $Res Function(RequestError<T>) _then;

/// Create a copy of RequestState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(RequestError<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as ApiErrorModel,
  ));
}


}

/// @nodoc
mixin _$HomeState implements DiagnosticableTreeMixin {

 RequestState<SummaryResponse> get summaryState; RequestState<SalesChartResponse> get salesChartState; RequestState<List<TopProductEntity>> get topProductsState; RequestState<LowStockResponse> get lowStockState;
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateCopyWith<HomeState> get copyWith => _$HomeStateCopyWithImpl<HomeState>(this as HomeState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState'))
    ..add(DiagnosticsProperty('summaryState', summaryState))..add(DiagnosticsProperty('salesChartState', salesChartState))..add(DiagnosticsProperty('topProductsState', topProductsState))..add(DiagnosticsProperty('lowStockState', lowStockState));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState&&(identical(other.summaryState, summaryState) || other.summaryState == summaryState)&&(identical(other.salesChartState, salesChartState) || other.salesChartState == salesChartState)&&(identical(other.topProductsState, topProductsState) || other.topProductsState == topProductsState)&&(identical(other.lowStockState, lowStockState) || other.lowStockState == lowStockState));
}


@override
int get hashCode => Object.hash(runtimeType,summaryState,salesChartState,topProductsState,lowStockState);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState(summaryState: $summaryState, salesChartState: $salesChartState, topProductsState: $topProductsState, lowStockState: $lowStockState)';
}


}

/// @nodoc
abstract mixin class $HomeStateCopyWith<$Res>  {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) _then) = _$HomeStateCopyWithImpl;
@useResult
$Res call({
 RequestState<SummaryResponse> summaryState, RequestState<SalesChartResponse> salesChartState, RequestState<List<TopProductEntity>> topProductsState, RequestState<LowStockResponse> lowStockState
});


$RequestStateCopyWith<SummaryResponse, $Res> get summaryState;$RequestStateCopyWith<SalesChartResponse, $Res> get salesChartState;$RequestStateCopyWith<List<TopProductEntity>, $Res> get topProductsState;$RequestStateCopyWith<LowStockResponse, $Res> get lowStockState;

}
/// @nodoc
class _$HomeStateCopyWithImpl<$Res>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._self, this._then);

  final HomeState _self;
  final $Res Function(HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? summaryState = null,Object? salesChartState = null,Object? topProductsState = null,Object? lowStockState = null,}) {
  return _then(_self.copyWith(
summaryState: null == summaryState ? _self.summaryState : summaryState // ignore: cast_nullable_to_non_nullable
as RequestState<SummaryResponse>,salesChartState: null == salesChartState ? _self.salesChartState : salesChartState // ignore: cast_nullable_to_non_nullable
as RequestState<SalesChartResponse>,topProductsState: null == topProductsState ? _self.topProductsState : topProductsState // ignore: cast_nullable_to_non_nullable
as RequestState<List<TopProductEntity>>,lowStockState: null == lowStockState ? _self.lowStockState : lowStockState // ignore: cast_nullable_to_non_nullable
as RequestState<LowStockResponse>,
  ));
}
/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<SummaryResponse, $Res> get summaryState {
  
  return $RequestStateCopyWith<SummaryResponse, $Res>(_self.summaryState, (value) {
    return _then(_self.copyWith(summaryState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<SalesChartResponse, $Res> get salesChartState {
  
  return $RequestStateCopyWith<SalesChartResponse, $Res>(_self.salesChartState, (value) {
    return _then(_self.copyWith(salesChartState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<List<TopProductEntity>, $Res> get topProductsState {
  
  return $RequestStateCopyWith<List<TopProductEntity>, $Res>(_self.topProductsState, (value) {
    return _then(_self.copyWith(topProductsState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<LowStockResponse, $Res> get lowStockState {
  
  return $RequestStateCopyWith<LowStockResponse, $Res>(_self.lowStockState, (value) {
    return _then(_self.copyWith(lowStockState: value));
  });
}
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HomeState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HomeState value)  $default,){
final _that = this;
switch (_that) {
case _HomeState():
return $default(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HomeState value)?  $default,){
final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( RequestState<SummaryResponse> summaryState,  RequestState<SalesChartResponse> salesChartState,  RequestState<List<TopProductEntity>> topProductsState,  RequestState<LowStockResponse> lowStockState)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.summaryState,_that.salesChartState,_that.topProductsState,_that.lowStockState);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( RequestState<SummaryResponse> summaryState,  RequestState<SalesChartResponse> salesChartState,  RequestState<List<TopProductEntity>> topProductsState,  RequestState<LowStockResponse> lowStockState)  $default,) {final _that = this;
switch (_that) {
case _HomeState():
return $default(_that.summaryState,_that.salesChartState,_that.topProductsState,_that.lowStockState);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( RequestState<SummaryResponse> summaryState,  RequestState<SalesChartResponse> salesChartState,  RequestState<List<TopProductEntity>> topProductsState,  RequestState<LowStockResponse> lowStockState)?  $default,) {final _that = this;
switch (_that) {
case _HomeState() when $default != null:
return $default(_that.summaryState,_that.salesChartState,_that.topProductsState,_that.lowStockState);case _:
  return null;

}
}

}

/// @nodoc


class _HomeState with DiagnosticableTreeMixin implements HomeState {
  const _HomeState({this.summaryState = const RequestState<SummaryResponse>.initial(), this.salesChartState = const RequestState<SalesChartResponse>.initial(), this.topProductsState = const RequestState<List<TopProductEntity>>.initial(), this.lowStockState = const RequestState<LowStockResponse>.initial()});
  

@override@JsonKey() final  RequestState<SummaryResponse> summaryState;
@override@JsonKey() final  RequestState<SalesChartResponse> salesChartState;
@override@JsonKey() final  RequestState<List<TopProductEntity>> topProductsState;
@override@JsonKey() final  RequestState<LowStockResponse> lowStockState;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HomeStateCopyWith<_HomeState> get copyWith => __$HomeStateCopyWithImpl<_HomeState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState'))
    ..add(DiagnosticsProperty('summaryState', summaryState))..add(DiagnosticsProperty('salesChartState', salesChartState))..add(DiagnosticsProperty('topProductsState', topProductsState))..add(DiagnosticsProperty('lowStockState', lowStockState));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HomeState&&(identical(other.summaryState, summaryState) || other.summaryState == summaryState)&&(identical(other.salesChartState, salesChartState) || other.salesChartState == salesChartState)&&(identical(other.topProductsState, topProductsState) || other.topProductsState == topProductsState)&&(identical(other.lowStockState, lowStockState) || other.lowStockState == lowStockState));
}


@override
int get hashCode => Object.hash(runtimeType,summaryState,salesChartState,topProductsState,lowStockState);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState(summaryState: $summaryState, salesChartState: $salesChartState, topProductsState: $topProductsState, lowStockState: $lowStockState)';
}


}

/// @nodoc
abstract mixin class _$HomeStateCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory _$HomeStateCopyWith(_HomeState value, $Res Function(_HomeState) _then) = __$HomeStateCopyWithImpl;
@override @useResult
$Res call({
 RequestState<SummaryResponse> summaryState, RequestState<SalesChartResponse> salesChartState, RequestState<List<TopProductEntity>> topProductsState, RequestState<LowStockResponse> lowStockState
});


@override $RequestStateCopyWith<SummaryResponse, $Res> get summaryState;@override $RequestStateCopyWith<SalesChartResponse, $Res> get salesChartState;@override $RequestStateCopyWith<List<TopProductEntity>, $Res> get topProductsState;@override $RequestStateCopyWith<LowStockResponse, $Res> get lowStockState;

}
/// @nodoc
class __$HomeStateCopyWithImpl<$Res>
    implements _$HomeStateCopyWith<$Res> {
  __$HomeStateCopyWithImpl(this._self, this._then);

  final _HomeState _self;
  final $Res Function(_HomeState) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? summaryState = null,Object? salesChartState = null,Object? topProductsState = null,Object? lowStockState = null,}) {
  return _then(_HomeState(
summaryState: null == summaryState ? _self.summaryState : summaryState // ignore: cast_nullable_to_non_nullable
as RequestState<SummaryResponse>,salesChartState: null == salesChartState ? _self.salesChartState : salesChartState // ignore: cast_nullable_to_non_nullable
as RequestState<SalesChartResponse>,topProductsState: null == topProductsState ? _self.topProductsState : topProductsState // ignore: cast_nullable_to_non_nullable
as RequestState<List<TopProductEntity>>,lowStockState: null == lowStockState ? _self.lowStockState : lowStockState // ignore: cast_nullable_to_non_nullable
as RequestState<LowStockResponse>,
  ));
}

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<SummaryResponse, $Res> get summaryState {
  
  return $RequestStateCopyWith<SummaryResponse, $Res>(_self.summaryState, (value) {
    return _then(_self.copyWith(summaryState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<SalesChartResponse, $Res> get salesChartState {
  
  return $RequestStateCopyWith<SalesChartResponse, $Res>(_self.salesChartState, (value) {
    return _then(_self.copyWith(salesChartState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<List<TopProductEntity>, $Res> get topProductsState {
  
  return $RequestStateCopyWith<List<TopProductEntity>, $Res>(_self.topProductsState, (value) {
    return _then(_self.copyWith(topProductsState: value));
  });
}/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RequestStateCopyWith<LowStockResponse, $Res> get lowStockState {
  
  return $RequestStateCopyWith<LowStockResponse, $Res>(_self.lowStockState, (value) {
    return _then(_self.copyWith(lowStockState: value));
  });
}
}

// dart format on

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:skeleton_mobile_app/core/networking/api_error_model.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/low_stock_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/sales_chart_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/summary_response.dart';
import 'package:skeleton_mobile_app/features/home/domain/entities/top_product_entity.dart';

part 'home_state.freezed.dart';

@freezed
abstract class RequestState<T> with _$RequestState<T> {
  const factory RequestState.initial() = RequestInitial<T>;
  const factory RequestState.loading() = RequestLoading<T>;
  const factory RequestState.success(T data) = RequestSuccess<T>;
  const factory RequestState.error(ApiErrorModel error) = RequestError<T>;
}

@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    @Default(RequestState<SummaryResponse>.initial())
    RequestState<SummaryResponse> summaryState,
    @Default(RequestState<SalesChartResponse>.initial())
    RequestState<SalesChartResponse> salesChartState,
    @Default(RequestState<List<TopProductEntity>>.initial())
    RequestState<List<TopProductEntity>> topProductsState,
    @Default(RequestState<LowStockResponse>.initial())
    RequestState<LowStockResponse> lowStockState,
  }) = _HomeState;
}
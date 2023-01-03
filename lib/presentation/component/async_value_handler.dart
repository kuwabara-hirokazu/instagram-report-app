import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_report_app/util/logger.dart';

// RiverpodのAsyncValueのハンドリングを共通化したWidget
class AsyncValueHandler<T extends Object> extends StatelessWidget {
  const AsyncValueHandler({
    super.key,
    required this.value,
    required this.builder,
    this.loading,
    this.error,
    this.dataNull,
  });

  final AsyncValue<T?> value;
  final Widget Function(T) builder;
  final Widget Function()? loading;
  final Widget Function(Object, StackTrace?)? error;
  final Widget Function()? dataNull;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: (data) {
        if (data == null) {
          return dataNull?.call() ?? const SizedBox();
        }
        return builder(data);
      },
      error: (e, s) {
        logger.e('Error', e, s);
        return error?.call(e, s) ?? const SizedBox();
      },
      loading: () {
        return loading?.call() ?? const SizedBox();
      },
    );
  }
}

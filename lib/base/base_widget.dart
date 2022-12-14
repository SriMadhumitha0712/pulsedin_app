// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseWidget<T extends ChangeNotifier> extends StatefulWidget {
  final Widget Function(BuildContext context, T? model, Widget? child) builder;
  final ProviderBase providerBase;
  final Function(T)? onModelReady;
  final Widget? child;

  const BaseWidget({
    Key? key,
    required this.builder,
    required this.providerBase,
    this.onModelReady,
    this.child,
  }) : super(key: key);

  @override
  _BaseWidget<T> createState() => _BaseWidget<T>();
}

class _BaseWidget<T extends ChangeNotifier> extends State<BaseWidget<T>> {
  T? _model;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        _model = ref.watch(widget.providerBase as ProviderListenable<T>);
        widget.onModelReady?.call(_model!);
        return widget.builder(context, _model, child);
      },
      child: widget.child,
    );
  }
}

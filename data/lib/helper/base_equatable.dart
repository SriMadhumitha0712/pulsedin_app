import 'package:equatable/equatable.dart';

class BaseEquatable extends Equatable {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
   
    return runtimeType.toString();
  }
}

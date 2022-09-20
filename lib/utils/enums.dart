// ignore_for_file: constant_identifier_names, depend_on_referenced_packages

import 'package:json_annotation/json_annotation.dart';

enum AppTheme {
  dark,
  light,
}

enum AuthenticationStatus {
  AUTHENTICATED,
  UNAUTHENTICATED,
  AUTHENTICATION_IN_PROGRESS,
}

enum CustomDataCellAction {
  view,
  edit,
  delete,
}

enum CustomDataHeaderAction {
  disabled,
  none,
  ascending,
  descending,
}

enum CustomDataCellType {
  actions,
  checkbox,
  text,
  sno,
  widget,
}

enum StudentsFilterType { all, disabled }

enum Roles {
  @JsonValue("super_admin")
  superAdmin
}

enum CallbackType {
  onEdit,
  onDelete,
  onMove,
}

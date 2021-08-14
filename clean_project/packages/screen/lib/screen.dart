import 'package:flutter/material.dart';

/// [TemplateBuilder]
///
abstract class _TemplateBuilder {
  Widget buildTemplate(BuildContext context);
}

/// [Screen]
///
abstract class Screen extends StatelessWidget with _TemplateBuilder {
  const Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return this.buildTemplate(context);
  }
}

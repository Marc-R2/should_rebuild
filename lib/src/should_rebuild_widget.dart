part of '../should_rebuild.dart';

/// A Widget wrapper that rebuilds the child only when the given [ShouldRebuild]
/// is true.
class ShouldRebuildWidget<T extends ShouldRebuild<T>> extends StatefulWidget {
  /// Creates a [ShouldRebuildWidget] that rebuilds the child only when the
  /// given [ShouldRebuild] is true.
  const ShouldRebuildWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  /// The child widget to rebuild when the [ShouldRebuild] is true.
  final T child;

  @override
  ShouldRebuildWidgetState createState() => ShouldRebuildWidgetState<T>();
}

/// The state of a [ShouldRebuildWidget].
class ShouldRebuildWidgetState<T extends ShouldRebuild<T>>
    extends State<ShouldRebuildWidget<T>> {
  /// The current Widget that is being displayed.
  late T currentWidget;

  @override
  void initState() {
    currentWidget = widget.child;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final newWidget = widget.child;
    if (newWidget.shouldRebuild(currentWidget, newWidget)) {
      currentWidget = newWidget;
    }
    return currentWidget;
  }
}

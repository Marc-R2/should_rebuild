part of '../should_rebuild.dart';

/// Let your Stateful- or StatelessWidget implement this interface to
/// to decide if it should rebuild or not.
abstract class ShouldRebuild<T extends Widget> extends Widget {
  /// Create a ShouldRebuild widget.
  const ShouldRebuild({required Key key}) : super(key: key);

  /// Return true if the widget should rebuild.
  bool shouldRebuild(T oldWidget, T newWidget);
}

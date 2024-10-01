import 'package:random_colors/presentation/base/viewmodel.dart';

/// Abstract class representing the state of the HomePage.
/// Extends [ViewModelState] to provide state management functionality.
abstract class HomePageState extends ViewModelState {
  /// Indicates whether the page is currently loading.
  abstract final bool isLoading;

  /// Contains any error message to be displayed.
  abstract final String errorMessage;

  /// Represents the current color, can be null if no color is selected.
  abstract final String? color;

  /// Creates a [HomePageState].
  const HomePageState();

  /// Creates a copy of this state with the given fields replaced with
  /// new values.
  /// @param isLoading The new loading state.
  /// @param errorMessage The new error message.
  /// @param color The new color.
  /// @return A new instance of [HomePageState] with the updated fields.
  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? color,
  });
}

/// Concrete implementation of [HomePageState].
class HomePageStateImpl extends HomePageState {
  /// Indicates whether the page is currently loading.
  @override
  final bool isLoading;

  /// Contains any error message to be displayed.
  @override
  final String errorMessage;

  /// Represents the current color, can be null if no color is selected.
  @override
  final String? color;

  /// List of properties used for equality comparison.
  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        color,
      ];

  /// Creates a [HomePageStateImpl] with the given parameters.
  ///
  /// @param isLoading The loading state, defaults to false.
  /// @param errorMessage The error message, defaults to an empty string.
  /// @param color The current color, can be null.
  const HomePageStateImpl({
    this.isLoading = false,
    this.errorMessage = '',
    this.color,
  });

  /// Factory constructor to create an initial state.
  ///
  /// @return A new instance of [HomePageStateImpl] with default values.
  factory HomePageStateImpl.initial() => const HomePageStateImpl();

  /// Creates a copy of this state with the given fields replaced
  /// with new values.
  /// @param isLoading The new loading state.
  /// @param errorMessage The new error message.
  /// @param color The new color.
  /// @return A new instance of [HomePageStateImpl] with the updated fields.
  @override
  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? color,
  }) =>
      HomePageStateImpl(
        isLoading: isLoading ?? this.isLoading,
        errorMessage: errorMessage ?? this.errorMessage,
        color: color ?? this.color,
      );
}

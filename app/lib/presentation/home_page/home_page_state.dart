import 'package:random_colors/presentation/base/viewmodel.dart';

abstract class HomePageState extends ViewModelState {
  const HomePageState();

  abstract final bool isLoading;
  abstract final String errorMessage;
  abstract final String? color;

  HomePageState copyWith({
    bool? isLoading,
    String? errorMessage,
    String? color,
  });
}

class HomePageStateImpl extends HomePageState {
  @override
  final bool isLoading;
  @override
  final String errorMessage;
  @override
  final String? color;

  @override
  List<Object?> get props => [
        isLoading,
        errorMessage,
        color,
      ];

  const HomePageStateImpl({
    this.isLoading = false,
    this.errorMessage = '',
    this.color,
  });

  factory HomePageStateImpl.initial() => const HomePageStateImpl();

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

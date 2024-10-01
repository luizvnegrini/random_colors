/// Enum representing different application environments (flavors).
enum Flavor {
  /// Development environment
  dev,

  /// Homologation environment
  hml,

  /// Production environment
  prod,
}

/// Class that manages flavor-specific configurations for the application.
class F {
  /// The current flavor of the application.
  static Flavor? appFlavor;

  /// Returns the name of the current flavor as a string.
  ///
  /// If no flavor is set, it returns an empty string.
  static String get name => appFlavor?.name ?? '';

  /// Returns the application title based on the current flavor.
  static String get title {
    const appTitle = 'Random Colors';

    switch (appFlavor) {
      case Flavor.dev:
        return '$appTitle dev';
      case Flavor.hml:
        return '$appTitle hml';
      case Flavor.prod:
        return '$appTitle prod';
      default:
        return appTitle;
    }
  }
}

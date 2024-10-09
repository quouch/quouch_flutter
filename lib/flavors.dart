enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Quouch Dev';
      case Flavor.prod:
        return 'Quouch';
      default:
        return 'Quouch Local';
    }
  }

  static String get apiBaseUrl {
    switch (appFlavor) {
      case Flavor.dev:
        return 'https://localhost:3000/api/v1';
      case Flavor.prod:
        return 'https://quouch-app.com/api/v1';
      default:
        return 'https://localhost:3000/api/v1';
    }
  }
}

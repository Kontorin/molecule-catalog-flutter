class AppRoutes {
  static const list = '/';

  static const moleculeIdParameter = 'id';
  static const mechanismIdParameter = 'mechanismId';

  static const moleculePath = 'molecule/:$moleculeIdParameter';
  static const mechanismPath = 'mechanism/:$mechanismIdParameter';

  static String molecule(String id) {
    final path = moleculePath.replaceFirst(
      ':$moleculeIdParameter',
      Uri.encodeComponent(id),
    );

    return '$list$path';
  }

  static String mechanism(String moleculeId, int mechanismId) {
    final path = mechanismPath.replaceFirst(
      ':$mechanismIdParameter',
      Uri.encodeComponent(mechanismId.toString()),
    );

    return '${molecule(moleculeId)}/$path';
  }
}

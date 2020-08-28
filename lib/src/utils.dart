library aisweb.utils;

abstract class Utils {
  static String buildQuery(Map<String, dynamic> params) {
    final query = [];
    params.forEach((key, val) {
      if (val != null) {
        if (val is Iterable) {
          query.add("$key=${val.map((v) => v.toString()).join("|")}");
        } else {
          query.add('$key=${val.toString()}');
        }
      }
    });
    return query.join('&');
  }
}

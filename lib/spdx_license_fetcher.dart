import 'package:http/http.dart' as http;

final _spdxBaseUrl =
    'https://raw.githubusercontent.com/spdx/license-list-XML/master/src';

Future<String> fetchLicense(String licenseIdentifier) async {
  final url = '$_spdxBaseUrl/$licenseIdentifier.xml';
  final uri = Uri.parse(url);
  print(uri.toString());

  final result = await http.get(uri);

  if (result.statusCode != 200) {
    return Future.error('There seems an Error: ${result.body}\n');
  } else {
    print('\nLicense fetched Successfully!\n');
  }
  return result.body;
}

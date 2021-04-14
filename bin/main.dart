import 'dart:io';
import 'package:args/args.dart';
import 'package:spdx_license_fetcher/spdx_license_fetcher.dart'
    as spdx_license_fetcher;
import 'package:xml/xml.dart';
import '../lib/spdx_license_fetcher.dart';

void main(List<String> arguments) async {
  exitCode = 0;

  final parser = ArgParser()
    ..addOption('license', abbr: 'l', defaultsTo: 'MIT');

  final argResult = parser.parse(arguments);

  var rawLicense = await fetchLicense(argResult['license']);

  //Going to write a script to parse xml file without the use of any package
  var formattedLicense = XmlDocument.parse(rawLicense).text;

  print(formattedLicense);
}

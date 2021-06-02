Dart AISWeb
===========

This project is a library to use [DECEA's API-AISWeb](https://aisweb.decea.mil.br/?i=publicacoes&p=api) from `dart` scripts (no official)

### [API AISWEB](https://documenter.getpostman.com/view/7201070/SzKQyg3H)

- [ ] Aeronautical Charts
- [ ] AIP
- [x] Rotaer
    - [x] rotaer (aerodromes list)
    - [x] rotaer (aerodrome data)
    - [ ] infotemp
- [ ] GEILOC
- [ ] NOTAM
- [ ] Sunrise and Sunset Table
- [ ] Airspace
- [ ] Meteorology
- [ ] Routes

## Usage ##

Get your API ID and API Key with Brazilian Air Force Department of Airspace Control [(DECEA)](https://aisweb.decea.mil.br/?i=publicacoes&p=api)


To use this library in your code:

* add a dependency in your `pubspec.yaml` :

    ```yaml
    dependencies:
    aisweb:
    ```

* add import in your `dart` code:

    ```dart
    import 'package:aisweb/aisweb.dart';
    ```

## Example ##  

A very simple example:

    ```dart
    import 'package:aisweb/aisweb.dart' show Rotaer, RotaerData;
    
    void main() async {
        Rotaer rotaer = Rotaer(apiKey: apiKey, apiPass: apiPass);
    
        RotaerData aiswebResponse = await rotaer.getAerodrome('SNZR');
        
        List<RotaerData> aiswebResponse = await rotaer.getAerodromesList(
          city: 'Paracatu', uf: 'MG', type: AerodromesTypes.AD);
        
        print(aiswebResponse.first);
    }
    ```

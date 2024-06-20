//ignore: constant_identifier_names
enum MobileOSType { Android, IOS, CE }

extension MobileOS on MobileOSType {
  int getValue() {
    switch (this) {
      case MobileOSType.Android:
        return 1;
      case MobileOSType.IOS:
        return 2;
      case MobileOSType.CE:
        return 3;
    }
  }
}

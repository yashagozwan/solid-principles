// abstract interface class SmartDevice {
//   void makeCall();
//   void sendEmail();
//   void browseInternet();
//   void takePicture();
// }

// class Smartphone implements SmartDevice {
//   @override
//   void browseInternet() {
//     print('Browsing the Internet..');
//   }

//   @override
//   void makeCall() {
//     print('Making a call...');
//   }

//   @override
//   void sendEmail() {
//     print('Sending an email...');
//   }

//   @override
//   void takePicture() {
//     print('Taking a picture');
//   }
// }

// class SmartWatch extends SmartDevice {
//   @override
//   void browseInternet() {
//     throw UnimplementedError();
//   }

//   @override
//   void makeCall() {
//     print('Making a call...');
//   }

//   @override
//   void sendEmail() {
//     throw UnimplementedError();
//   }

//   @override
//   void takePicture() {
//     throw UnimplementedError();
//   }
// }

abstract interface class Phone {
  void makeCall();
}

abstract interface class EmailDevice {
  void sendEmail();
}

abstract interface class WebBrowser {
  void browserInternet();
}

abstract interface class Camera {
  void takePicture();
}

class SmartWatch implements Phone {
  @override
  void makeCall() {
    print('Making a call...');
  }
}

class Smartphone implements Phone, EmailDevice, WebBrowser, Camera {
  @override
  void browserInternet() {
    print('browser');
  }

  @override
  void makeCall() {
    print('call');
  }

  @override
  void sendEmail() {
    print('email');
  }

  @override
  void takePicture() {
    print('picture');
  }
}

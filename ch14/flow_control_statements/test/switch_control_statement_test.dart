import 'package:test/test.dart';

void main() {
  test('swith definition', () {
    void pay() {
      expect(true, isFalse);
    }

    void unpay() {
      expect(true, isFalse);
    }

    void rejected() {
      expect(true, isFalse);
    }

    void check() {
      expect(true, isTrue);
    }

    var action = 'Open';
    switch (action) {
      case 'Paid':
        pay();
        break;
      case 'Unpaid':
        unpay();
        break;
      case 'Rejected':
        rejected();
        break;
      default:
        check();
    }
  });

  test('empty cases', () {
    void pay() {
      expect(true, isFalse);
    }

    void unpaid() {
      expect(true, isTrue);
    }

    final invoiceStatus = 'Rejected';
    switch (invoiceStatus) {
      case 'Paid':
        pay();
        break;
      case 'Unpaid':
      case 'Rejected':
        unpaid();
        break;
      default:
        throw ('Error invoice Status!');
    }
  });

  test('local variable', () {
    String result;
    void pay() {
      expect(true, isFalse);
    }

    void unpaid() {
      expect(true, isTrue);
    }

    void sendEmail({String subject, String to}) {
      result = subject;
    }

    final invoiceStatus = 'Error';

    expect(() {
      switch (invoiceStatus) {
        case 'Paid':
          pay();
          break;
        case 'UnPaid':
        case 'Rejected':
          unpaid();
          break;
        default:
          final error = 'Error Invoice Status!';
       
          sendEmail(subject: error, to: 'error@company.com');
          throw Exception(error);
      }
    }, throwsA(isException));
   
    expect(result, 'Error Invoice Status!');
  });
}

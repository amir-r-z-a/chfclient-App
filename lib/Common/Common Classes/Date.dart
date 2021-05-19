class Date {
  String _year;

  String _month;
  String _day;
  String _hour;
  String _minute;
  String _second;

  Date(this._year, this._month, this._day, this._hour, this._minute,
      this._second);

  String dateFormatter() {
    return year +
        '/' +
        month +
        '/' +
        day +
        ' , ' +
        hour +
        ':' +
        minute +
        ':' +
        second;
  }

  // bool validDate(Date input, int i) {
  //   if (int.parse(input.year) != int.parse(year)) {
  //     if (int.parse(input.year) < int.parse(year)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (int.parse(input.month) != int.parse(month)) {
  //     if (int.parse(input.month) < int.parse(month)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (int.parse(input.day) != int.parse(day)) {
  //     if (int.parse(input.day) < int.parse(day) + i) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (int.parse(input.hour) != int.parse(hour)) {
  //     if (int.parse(input.hour) < int.parse(hour)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (int.parse(input.minute) != int.parse(minute)) {
  //     if (int.parse(input.minute) < int.parse(minute)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   } else if (int.parse(input.second) != int.parse(second)) {
  //     if (int.parse(input.second) < int.parse(second)) {
  //       return true;
  //     } else {
  //       return false;
  //     }
  //   }
  //   return true;
  // }

  // bool validDate(Date input, int i) {
  //   int x = int.parse(day);
  //   for (int j = 1; j <= int.parse(input.month); j++) {
  //     if (j <= 6 && j >= 1) {
  //       input.day = (int.parse(input.day) + 31).toString();
  //       x += 31;
  //     } else if (j <= 11 && j >= 7) {
  //       input.day = (int.parse(input.day) + 30).toString();
  //       x += 30;
  //     } else {
  //       input.day = (int.parse(input.day) + 29).toString();
  //       x += 29;
  //     }
  //   }
  //   if (int.parse(input.year) == int.parse(year) &&
  //       int.parse(input.day) - x <= i) {
  //     if (int.parse(input.day) - x < i) {
  //       return true;
  //     } else if (int.parse(input.day) - x == i &&
  //         int.parse(hour) <= int.parse(input.hour)) {
  //       if (int.parse(hour) < int.parse(input.hour)) {
  //         return true;
  //       } else if (int.parse(hour) == int.parse(input.hour) &&
  //           int.parse(minute) <= int.parse(input.minute)) {
  //         if (int.parse(minute) < int.parse(input.minute)) {
  //           return true;
  //         } else if (int.parse(minute) == int.parse(input.minute) &&
  //             int.parse(second) <= int.parse(input.second)) {
  //           return true;
  //         }
  //         return false;
  //       }
  //       return false;
  //     }
  //     return false;
  //   }
  //   return false;
  // }

  bool validDate(Date input, int i) {
    int x = int.parse(second) +
        (60 * int.parse(minute)) +
        (3600 * int.parse(hour)) +
        (24 * 3600 * int.parse(day));
    int y = int.parse(input.second) +
        (60 * int.parse(input.minute)) +
        (3600 * int.parse(input.hour)) +
        (24 * 3600 * int.parse(input.day));
    for (int j = 0; j < int.parse(month); j++) {
      //month ha be khareji bashad
      if (j <= 6 && j >= 1) {
        x += 31 * (24 * 3600);
      } else if (j <= 11 && j >= 7) {
        x += 30 * (24 * 3600);
      } else {
        x += 29 * (24 * 3600);
      }
    }
    for (int j = 1; j <= int.parse(input.month); j++) {
      if (j <= 6 && j >= 1) {
        y += 31 * (24 * 3600);
      } else if (j <= 11 && j >= 7) {
        y += 30 * (24 * 3600);
      } else {
        y += 29 * (24 * 3600);
      }
    }
    x += 365 * (24 * 3600 * int.parse(year));
    y += 365 * (24 * 3600 * int.parse(input.year));
    return (y - x) <= (24 * 3600 * i);
  }

  String get year => _year;

  set year(String value) {
    _year = value;
  }

  String get month => _month;

  String get second => _second;

  set second(String value) {
    _second = value;
  }

  String get minute => _minute;

  set minute(String value) {
    _minute = value;
  }

  String get hour => _hour;

  set hour(String value) {
    _hour = value;
  }

  String get day => _day;

  set day(String value) {
    _day = value;
  }

  set month(String value) {
    _month = value;
  }
}

//  bool validDate(Date input, int i) {
//     if (int.parse(input.year) == int.parse(year) &&
//         int.parse(input.month) == int.parse(month) &&
//         int.parse(input.day) - int.parse(day) <= i) {
//       if (int.parse(input.day) - int.parse(day) < i) {
//         return true;
//       } else if (int.parse(input.day) - int.parse(day) == i &&
//           int.parse(hour) <= int.parse(input.hour)) {
//         if (int.parse(hour) < int.parse(input.hour)) {
//           return true;
//         } else if (int.parse(hour) == int.parse(input.hour) &&
//             int.parse(minute) <= int.parse(input.minute)) {
//           if (int.parse(minute) < int.parse(input.minute)) {
//             return true;
//           } else if (int.parse(minute) == int.parse(input.minute) &&
//               int.parse(second) <= int.parse(input.second)) {
//             return true;
//           }
//           return false;
//         }
//         return false;
//       }
//       return false;
//     }
//     return false;
//   }

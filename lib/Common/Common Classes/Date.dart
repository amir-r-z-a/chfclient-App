import 'package:intl/intl.dart';

class Date {
  String year;
  String month;
  String day;
  String hour;
  String minute;
  String second;

  Date({this.year, this.month, this.day, this.hour, this.minute, this.second}) {
    if (this.year == null) {
      DateTime now = DateTime.now();
      String current = DateFormat('yy:MM:dd:kk:mm:ss').format(now);
      this.year = current.split(":")[0];
      this.month = current.split(":")[1];
      this.day = current.split(":")[2];
      this.hour = current.split(":")[3];
      this.minute = current.split(":")[4];
      this.second = current.split(":")[5];
    }
  }

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
  bool compareTime(String s, String e) {
    int s1 = int.parse(s.split(":")[0]) * 60 + int.parse(s.split(":")[1]);
    int e1 = int.parse(e.split(":")[0]) * 60 + int.parse(e.split(":")[1]);
    int current1 = int.parse(hour) * 60 + int.parse(minute);
    return (current1 >= s1 && current1 <= e1);
  }

// static String currentTime (){
//   DateTime now = DateTime.now();
//   return DateFormat('kk:mm').format(now);
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

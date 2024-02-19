import 'dart:io';

class Event {
  String title;
  DateTime dateTime;

  Event(this.title, this.dateTime);
}

void main() {
  List<Event> events = [];

  while (true) {
    print('1. Add Event');
    print('2. View Events');
    print('3. Exit');
    stdout.write('Select an option: ');
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        addEvent(events);
        break;
      case 2:
        viewEvents(events);
        break;
      case 3:
        print('Exiting...');
        return;
      default:
        print('Invalid option. Please try again.');
    }
  }
}

void addEvent(List<Event> events) {
  stdout.write('Enter event title: ');
  var title = stdin.readLineSync() ?? '';

  stdout.write('Enter event date (YYYY-MM-DD): ');
  var dateString = stdin.readLineSync() ?? '';
  var dateParts = dateString.split('-');
  var year = int.tryParse(dateParts[0] ?? '') ?? 0;
  var month = int.tryParse(dateParts[1] ?? '') ?? 0;
  var day = int.tryParse(dateParts[2] ?? '') ?? 0;

  stdout.write('Enter event time (HH:MM): ');
  var timeString = stdin.readLineSync() ?? '';
  var timeParts = timeString.split(':');
  var hour = int.tryParse(timeParts[0] ?? '') ?? 0;
  var minute = int.tryParse(timeParts[1] ?? '') ?? 0;

  var dateTime = DateTime(year, month, day, hour, minute);
  var event = Event(title, dateTime);
  events.add(event);

  print('Event added successfully!');
}

void viewEvents(List<Event> events) {
  if (events.isEmpty) {
    print('No events scheduled.');
  } else {
    print('Scheduled Events:');
    for (var i = 0; i < events.length; i++) {
      print('${i + 1}. ${events[i].title} - ${events[i].dateTime}');
    }
  }
}

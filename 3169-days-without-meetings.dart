int countDaysWithoutMeetings(int days, List<List<int>> meetings) {
  if (meetings.isEmpty) return days;

  meetings.sort((a, b) => a[0].compareTo(b[0]));

  List<List<int>> mergedMeetings = [];
  List<int> currentMeeting = List.from(meetings[0]);

  for (int i = 1; i < meetings.length; i++) {
    if (currentMeeting[1] >= meetings[i][0]) {
      currentMeeting[1] = currentMeeting[1] > meetings[i][1]
          ? currentMeeting[1]
          : meetings[i][1];
    } else {
      mergedMeetings.add(List.from(currentMeeting));
      currentMeeting = List.from(meetings[i]);
    }
  }

  mergedMeetings.add(List.from(currentMeeting));

  int daysWithMeetings = 0;
  for (var meeting in mergedMeetings) {
    daysWithMeetings += meeting[1] - meeting[0] + 1;
  }

  return days - daysWithMeetings;
}

void main() {
  int days1 = 10;
  List<List<int>> meetings1 = [
    [5, 7],
    [1, 3],
    [9, 10]
  ];
  print('Example 1: ${countDaysWithoutMeetings(days1, meetings1)}');

  int days2 = 5;
  List<List<int>> meetings2 = [
    [2, 4],
    [1, 3]
  ];
  print('Example 2: ${countDaysWithoutMeetings(days2, meetings2)}');

  int days3 = 6;
  List<List<int>> meetings3 = [
    [1, 6]
  ];
  print('Example 3: ${countDaysWithoutMeetings(days3, meetings3)}');
}

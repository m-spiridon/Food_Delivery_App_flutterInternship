import 'package:flutter/material.dart';
import 'package:internship_project_1/generated/l10n.dart';
import 'package:internship_project_1/shared/px2dpx.dart';
import 'package:intl/intl.dart';

class Slot {
  String time;
  DateTime day;
  bool isSelected;

  Slot({this.time, this.day, this.isSelected = false});
}

List<String> timeSlots = [
  '7:00am - 9:00am',
  '9:00am - 11:00am',
  '11:00am - 1:00pm',
  '12:00pm - 2:00pm',
  '2:00pm - 4:00pm',
  '4:00pm - 6:00pm',
  '6:00pm - 8:00pm',
  '8:00pm - 10:00pm',
];

List<DateTime> daySlots = [];

List<List<Slot>> slots = [];

Slot selectedSlot;
String selectedSlotText = 'Choose day\nand time';

class Cell extends StatelessWidget {
  final Color color;
  final Widget child;

  Cell({this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: convertPx2Dpx(context, 3)),
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 4.5,
      height: MediaQuery.of(context).size.height / 15,
      color: color,
      margin: EdgeInsets.all(convertPx2Dpx(context, 1.0)),
      child: child,
    );
  }
}

class CellSlot extends StatelessWidget {
  final int row;
  final int col;
  final Function onPress;

  CellSlot({this.row, this.col, this.onPress});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.white),
        padding: MaterialStateProperty.all(EdgeInsets.all(0.0)),
      ),
      child: Cell(
        color: selectedSlot == slots[row][col]
            ? Colors.grey.shade300
            : Colors.white,
        child: selectedSlot == slots[row][col]
            ? Icon(Icons.done_outline_rounded)
            : Text('Available'),
      ),
    );
  }
}

class DeliverySlot extends StatefulWidget {
  static const String id = 'delivery_slot';

  @override
  _DeliverySlotState createState() => _DeliverySlotState();
}

class _DeliverySlotState extends State<DeliverySlot> {
  void fillDaySlots() {
    for (int i = 0; i < 7; i++) {
      daySlots.add(DateTime.now().add(Duration(days: i)));
    }
  }

  void fillSlots() {
    timeSlots.forEach((element) {
      slots.add(List.generate(daySlots.length,
          (index) => Slot(time: element, day: daySlots[index])));
    });
  }

  @override
  void initState() {
    super.initState();
    fillDaySlots();
    fillSlots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.close),
          onPressed: () {},
        ),
        title: Text(S.of(context).deliverySlotTitle),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: <Widget>[
                Column(
                  children: [
                    Cell(color: Colors.grey.shade300),
                    ...List.generate(
                      timeSlots.length,
                      (index) => Cell(
                        color: Colors.grey.shade300,
                        child: Text('${timeSlots[index]}'),
                      ),
                    ),
                  ],
                ),
                Flexible(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Column(
                      children: [
                        Row(
                          children: List.generate(
                              daySlots.length,
                              (index) => Cell(
                                    color: Colors.grey.shade300,
                                    child: Text(
                                      '${DateFormat('d MMM').format(daySlots[index])}\n${DateFormat('E').format(daySlots[index])}',
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                        ),
                        ...List.generate(
                          timeSlots.length,
                          (i) => Row(children: [
                            ...List.generate(
                                daySlots.length,
                                (j) => CellSlot(
                                      row: i,
                                      col: j,
                                      onPress: () {
                                        setState(() {
                                          selectedSlot = slots[i][j];
                                        });
                                        selectedSlotText =
                                            '${DateFormat('E').format(slots[i][j].day)} ${DateFormat('d MMM').format(slots[i][j].day)}\n${slots[i][j].time}';
                                      },
                                    ))
                          ]),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              color: Colors.white,
              width: double.infinity,
              child: Text(
                'Some text about delivery',
                textAlign: TextAlign.center,
              ),
            ),
            ElevatedButton(
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(selectedSlotText),
                    Text(S.of(context).selectSlotBtnText),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

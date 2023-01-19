import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../globals/globals.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  DateTime currentdate = DateTime.now();
  TimeOfDay currenttime = TimeOfDay.now();
  List<String> month = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "Octomber",
    "November"
        "December",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            const Text(
              ' Shopping Cart',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: CupertinoTextField(
                prefix: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.person_fill,
                      color: Colors.grey,
                    ),
                  ],
                ),
                placeholder: " First Name",
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300)),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: CupertinoTextField(
                prefix: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.mail_solid,
                      color: Colors.grey,
                    ),
                  ],
                ),
                placeholder: " Email",
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.grey.shade300),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 50,
              child: CupertinoTextField(
                prefix: Row(
                  children: const [
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      Icons.location_on,
                      color: Colors.grey,
                    ),
                  ],
                ),
                placeholder: " Location",
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300)),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            GestureDetector(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (context) {
                      return Container(
                        height: 220,
                        color: Colors.white,
                        child: CupertinoDatePicker(
                          mode: CupertinoDatePickerMode.dateAndTime,
                          onDateTimeChanged: (datetime) {
                            int hour = datetime.hour;
                            int minute = datetime.minute;

                            setState(() {
                              currenttime =
                                  TimeOfDay(hour: hour, minute: minute);
                            });
                          },
                          initialDateTime: currentdate,
                          maximumYear: 2050,
                          minimumYear: 2000,
                        ),
                      );
                    });
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.shade300)),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    const Icon(CupertinoIcons.clock, color: Colors.grey),
                    const Text(
                      ' Delivery Time',
                      style: TextStyle(color: Colors.grey,fontSize: 16),
                    ),
                    const Spacer(),
                    Text(
                        "  ${currentdate.day},${month[currentdate.month - 1]},${currentdate.year}  "),
                    Text(
                      (currenttime.hour > 12)
                          ? "${currenttime.hour - 12}:${currenttime.minute} ${currenttime.period.name}"
                          : "${currenttime.hour}:${currenttime.minute} ${currenttime.period.name}",
                      // "${currentdate.hour},${currentdate.minute},${currentdate.second}",
                      style: const TextStyle(fontSize: 14),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
            ),
            ...CartProducts.map(
              (e) => Container(
                // margin: EdgeInsets.only(top: 20),
                height: 100,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              child: Image(
                                image: AssetImage('${e['image']}'),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  e['name'],
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '\$',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Text(
                                      '${e['price']}',
                                      style: const TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                const Text('\$'),
                                Text('${e['price']}'),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ).toList(),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Text(
                  'Tax :       \$18 ',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total Price : \$$sum ',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
            const SizedBox(
              height: 45,
            ),
          ],
        ),
      ),
    );
  }
}

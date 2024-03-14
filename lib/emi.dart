import 'package:flutter/material.dart';

class Emi extends StatefulWidget {
  const Emi({super.key});

  @override
  State<Emi> createState() => _EmiState();
}

class _EmiState extends State<Emi> {
  TextEditingController txtAmount = TextEditingController();
  TextEditingController txtInterest = TextEditingController();
  TextEditingController txtTenure = TextEditingController();

  double ans = 00;
  double EMI = 00;
  double emi = 00;

  int amount = 1000;
  int interest = 1;
  int tenure = 1;
  int yearly = 00;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        centerTitle: true,
        title: const Text(
          "EMI Calculator",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_circle_left_outlined,
          ),
          iconSize: 30,
          onPressed: () {
            Navigator.pushNamed(context, "/");
          },
        ),
      ),
      body: SingleChildScrollView(
        /// Main Column
        child: Column(
          children: [
            /// using of Slider
            Slider(value: amount.toDouble(),
              min: 0,
              max: 100000,
              divisions: 100,
              activeColor: Color(0xffC796C5),
              label: amount.toString(),
              onChanged: (value) {
              setState(() {
                amount = value.toInt();
                txtAmount = TextEditingController(text: amount.toString());
              });
              },
            ),
            /// Loan Amount in text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Loan Amount",
                    style: TextStyle(color: Color(0xffC796C5), fontSize: 17),
                  ),
                  SizedBox(
                    width: 22,
                  ),
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: txtAmount,
                      onChanged: (value) {
                        setState(() {
                          amount = int.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffC796C5), width: 2)),
                        border: OutlineInputBorder(
                            // borderSide:
                            ),
                        hintText: "Enter your amount",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// using of Slider
            Slider(value: interest.toDouble(),
              min: 1,
              max: 50,
              divisions: 50,
              activeColor: Color(0xffC796C5),
              label: interest.toString(),
              onChanged: (value) {
                setState(() {
                  interest = value.toInt();
                  txtInterest = TextEditingController(text: interest.toString());
                });
              },
            ),
            /// Interest in text field
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Interest (%)",
                    style: TextStyle(color: Color(0xffC796C5), fontSize: 17),
                  ),
                  SizedBox(
                    height: 90,
                    width: 37,
                  ),
                  Expanded(
                    child: TextField(
                      controller: txtInterest,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          interest = int.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffC796C5), width: 2)),
                        border: OutlineInputBorder(
                            // borderSide:
                            ),
                        hintText: "Enter your interest",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            /// using of Slider
            Slider(value: tenure.toDouble(),
              min: 1,
              max: 10,
              divisions: 10,
              activeColor: Color(0xffC796C5),
              label: tenure.toString(),
              onChanged: (value) {
                setState(() {
                  tenure = value.toInt();
                  txtTenure = TextEditingController(text: tenure.toString());
                });
              },
            ),
            /// Tenure and Year/ month in text field
            Row(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            "Tenure",
                            style:
                                TextStyle(color: Color(0xffC796C5), fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Row(
                        children: [
                          Text  (
                            "(Years/Months)",
                            style:
                                TextStyle(color: Color(0xffC796C5), fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                  width: 40,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 11),
                    child: TextField(
                      controller: txtTenure,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        setState(() {
                          tenure = int.parse(value);
                        });
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffC796C5), width: 2)),
                        border: OutlineInputBorder(),
                        hintText: "year",
                        contentPadding: EdgeInsets.all(10)
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                  width: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Color(0xffC796C5), width: 2)),
                        border: OutlineInputBorder(),
                        hintText: "Months",
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            /// Calculate EMI in GestureDetector
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        yearly = int.parse(txtInterest.text);
                        EMI = (int.parse(txtAmount.text) * int.parse(txtInterest.text) * int.parse(txtTenure.text))/100;
                        ans = (int.parse(txtAmount.text) + EMI);
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:20,top: 10),
                      child: Container(
                          height: 40,
                          width: 115,
                          decoration: BoxDecoration(
                            color: Color(0xffC796C5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Calculate",
                              style: TextStyle(color: Color(0xffFFFBFE), fontSize: 16),
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        txtTenure.clear();
                        txtInterest.clear();
                        txtAmount.clear();
                        ans = 00;
                        amount = 00;
                        yearly = 00;
                        EMI = 00;
                        interest = 1;
                        tenure = 1;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,top: 10),
                      child: Container(
                          height: 40,
                          width: 115,
                          decoration: BoxDecoration(
                            color: Color(0xffC796C5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "Reset",
                              style: TextStyle(color: Color(0xffFFFBFE), fontSize: 16),
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left:10,top: 10,right: 20),
                      child: Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffC796C5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text(
                              "History",
                              style: TextStyle(color: Color(0xffFFFBFE), fontSize: 16),
                            ),
                          ),
                      ),
                    ),
                  ),
                ),
        
              ],
            ),
            /// Simple text in a EMI Calculation Result
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Text(
                    "EMI Calculation Result",
                    style: TextStyle(
                        color: Color(0xff202121),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            /// Yearly
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 15),
                    child: Text(
                      "Yearly",
                      style: TextStyle(
                          color: Color(0xff202121),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 280, top: 15,right: 25),
                  child: Text("$yearly",
                    style: TextStyle(
                        color: Color(0xff202121),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            /// Total Interest
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Text(
                      "Total Interest",
                      style: TextStyle(
                          color: Color(0xff202121),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 244.5, top: 20,right: 25),
                  child: Text("$EMI",
                    style: TextStyle(
                        color: Color(0xff202121),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            /// Total Payment
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, top: 20,),
                    child: Text(
                      "Total Payment",
                      style: TextStyle(
                          color: Color(0xff202121),
                          fontSize: 15,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 238, top: 20,right: 25),
                  child: Text("$ans",
                    style: TextStyle(
                        color: Color(0xff202121),
                        fontSize: 15,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
            /// Check Details
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 50),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                        });
                      },
                      child: Container(
                        height: 40,
                        width: 120,
                        decoration: BoxDecoration(
                          color: Color(0xffC796C5),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            "Check Details",
                            style: TextStyle(color: Color(0xffFFFBFE), fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}

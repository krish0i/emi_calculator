import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 250, width: 400, child: Image.asset("calculate.png")),
          const Padding(
            padding: EdgeInsets.only(top: 70),
            child: Text(
              "Emi Calculator",
              style: TextStyle(
                  color: Color(0xffC796C5),
                  fontSize: 34,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text("Easy to calculator Installment",style: TextStyle(color: Colors.black),),
          const Text("With static`s",style: TextStyle(color: Colors.black),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top:50),
                child: Center(
                  child: GestureDetector(child: Stack(
                            children: [
                              Positioned(
                              child: Container(
                              height: 150,
                              width: 140,
                              decoration: BoxDecoration(
                    color: const Color(0xffE3D5E6),
                    borderRadius: const BorderRadius.all(Radius.circular(10),),
                    border: Border.all(color: const Color(0xffC796C5),width: 2)
                    ),
                  ),
                              ),
                  const Positioned(
                  height: 100,
                   width: 100,
                      left: 20,
                      child: Image(image: AssetImage("about.png"))
                     ),
                    const Positioned(
                    top: 90,
                        left: 50,
                        child: Text("EMI",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                        const Positioned(
                            top: 110,
                            left: 30,
                            child: Text("Calclator",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                            ],
                          ),
                    onTap: () {
                    Navigator.pushNamed(context, "emi");
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:50,left: 30),
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        height: 150,
                        width: 140,
                        decoration: BoxDecoration(
                          color: const Color(0xffE3D5E6),
                          borderRadius: const BorderRadius.all(Radius.circular(10),),
                            border: Border.all(color: const Color(0xffC796C5),width: 2)
                        ),
                      ),
                    ),
                    const Positioned(
                        height: 70,
                        width: 140,
                        top: 16,
                        child: Image(image: AssetImage("chart.png"),)
                    ),
                    const Positioned(
                      top: 85,
                        left: 36,
                        child: Text("Compare",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                    const Positioned(
                        top: 105,
                        left: 55,
                        child: Text("Loan",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),

            ],
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:quiz_app/core/utils/model.dart';

class QuestionsBody extends StatefulWidget {
  QuestionsBody({super.key, required this.index});
  int index;
  @override
  State<QuestionsBody> createState() => _QuestionsBodyState();
}

class _QuestionsBodyState extends State<QuestionsBody> {
  int? selected;
  int score = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            Text(
              "Simple Quiz App",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text(
                  "Question ${widget.index + 1}/${questions.length}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            Spacer(),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(10),
                  width: double.infinity,
                  height: 60,
                  child: Text(
                    textAlign: TextAlign.center,
                    questions[widget.index].question,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  top: 3,
                  left: -20,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  top: 3,
                  right: -20,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.black,
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: MediaQuery.of(context).size.width / 2 - 32,
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.quiz, color: const Color.fromARGB(255, 230, 214, 93), size: 30),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions[widget.index].answer.length,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  setState(() {
                    selected = index;
                  });
                },
                child: Container(
                  width: 200,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: selected == index ? const Color.fromARGB(255, 230, 214, 93) : Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      questions[widget.index].answer.keys.toList()[index],
                      style: TextStyle(
                        color: selected == index ? Colors.white : Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                fixedSize: Size(300, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusGeometry.circular(15),
                ),
              ),
              onPressed: () {
                setState(() {
                  questions[widget.index].answer.values.toList()[selected!] ==
                          true
                      ? score++ 
                      : score;

                  if (widget.index < questions.length - 1) {
                    widget.index++;
                  } else {
                    showDialog(
                    
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.white,
                        title: Text("Quiz Completed"),
                        content: Text("your score is $score"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
  selected = null;
  score = 0;
  widget.index = 0;
});
                            },
                            child: Text("ok",style: TextStyle(color: Colors.black),),
                          ),
                        ],
                      ),
                    );
                  }
                  selected = null;
                });
              },
              child: Text(
                questions.length - 1 > widget.index ? "Next" : "submit",
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}

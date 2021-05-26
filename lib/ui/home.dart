import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quizapp/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex=0;
  List questionBank=[
    Question.name("How many towels categories did Monica have?", "5", "7", "11", "12", "11"),
    Question.name("What was the occupation of Rachel’s fiancé Barry Farber?", "Doctor", "Orthodontist", "Lion tamer", "Actor", "Orthodontist"),
    Question.name("Phoebe’s scientist boyfriend David worked in what city?", "New Jersey", "New york", "Las vegas", "Minsk", "Minsk"),
    Question.name("What is the name of Ross and Rachel's daughter?", "Emily", "Emma", "Phoebe", "Elizabeth", "Emma"),
    Question.name("Which of Joey’s sisters did Chandler fool around with?", "Mary Angela", "Dina", "Tina", "Gina", "Mary Angela"),
    Question.name("What pet did Ross own?", "Keith", "ChiChi", "Lancelot", "Marcel", "Marcel"),
    Question.name("Monica briefly dates billionaire Pete Becker. Which country does he take her for their first date?", "Italy", "Greece", "Rome", "England", "Italy"),
    Question.name("Rachel was popular in high school. Her prom date Chip ditched her for which girl at school?", "Sally Roberts", "Amy Welsh", "Valerie Thompson", "Emily Foster", "Amy Welsh"),
    Question.name("Who sang the Friends theme?", "The Banksys", "The Rembrandts", "The Constables", "The Da Vinci Band", "The Rembrandts"),
    Question.name("How many long-stemmed roses did Ross send to Emily?", "82", "76", "72", "52", "72")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("F.r.i.e.n.d.s trivia",style: GoogleFonts.getFont("Luckiest Guy",textStyle: TextStyle(fontWeight: FontWeight.w500, fontSize: 30.0))),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.elliptical(50.0, 30.0),
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueGrey.shade700,
      toolbarHeight: 80.0,
      toolbarOpacity: 0.9,),
      backgroundColor: Colors.amberAccent.shade100,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
       children: <Widget>[
         Center(
           child: Image.asset('images/friends.png',
           width: 400,
           height: 250,),
         ),
         Padding(
           padding: const EdgeInsets.all(10.0),
           child: Container(
             decoration: BoxDecoration(
               color: HexColor("#ffb26b"),
               borderRadius: BorderRadius.circular((15.0),
               )
             ),
             height: 100.0,
               width: 350.0,
               child: Center(child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Text(questionBank[_currentQuestionIndex].questionText,style: GoogleFonts.getFont("EB Garamond",textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 22.0)),textAlign: TextAlign.center,),
               )),
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               ElevatedButton(onPressed: () => _checkAnswer(questionBank[_currentQuestionIndex].option1), child:Text(questionBank[_currentQuestionIndex].option1,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20.0),)),style: ElevatedButton.styleFrom(
                 primary: HexColor("#0a1931"),
                 padding: EdgeInsets.all(10.0),
                 minimumSize: Size(150.0, 50.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),),
               ElevatedButton(onPressed: () => _checkAnswer(questionBank[_currentQuestionIndex].option2), child:Text(questionBank[_currentQuestionIndex].option2,style:GoogleFonts.lato(textStyle: TextStyle(fontSize: 20.0),)),style: ElevatedButton.styleFrom(
                 primary: HexColor("#0a1931"),
                 padding: EdgeInsets.all(10.0),
                   minimumSize: Size(150.0, 50.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),)
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               ElevatedButton(onPressed: () => _checkAnswer(questionBank[_currentQuestionIndex].option3), child:Text(questionBank[_currentQuestionIndex].option3,style: GoogleFonts.lato(textStyle: TextStyle(fontSize: 20.0),)),style: ElevatedButton.styleFrom(
                 primary: HexColor("#0a1931"),
                 padding: EdgeInsets.all(10.0),
                 minimumSize: Size(150.0, 50.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),),
               ElevatedButton(onPressed: () => _checkAnswer(questionBank[_currentQuestionIndex].option4), child:Text(questionBank[_currentQuestionIndex].option4,style:GoogleFonts.lato(textStyle: TextStyle(fontSize: 20.0),)),style: ElevatedButton.styleFrom(
                   primary: HexColor("#0a1931"),
                   padding: EdgeInsets.all(10.0),
                   minimumSize: Size(150.0, 50.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),)
             ],
           ),
         ),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: <Widget>[
               ElevatedButton(onPressed: () => _nextQuestion(), child:Icon(Icons.double_arrow_rounded,size: 30.0,),style: ElevatedButton.styleFrom(
                 primary: HexColor("#0a1931"),
                 padding: EdgeInsets.all(10.0),
                 minimumSize: Size(150.0, 50.0),
                 shape: RoundedRectangleBorder(
                   borderRadius: new BorderRadius.circular(30.0),
                 ),
               ),),
             ],
           ),
         ),

         Spacer(),
       ],
        ),
      ),
    );
  }

  _checkAnswer(String userChoice) {
   if(userChoice==questionBank[_currentQuestionIndex].rightans){
     debugPrint("Yes correct");
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       backgroundColor: Colors.green,
       content: const Text('Correct!!'),
       duration: const Duration(milliseconds: 500),
     ));
   }
   else{
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(
       backgroundColor: Colors.redAccent,
       content: const Text('Wrong!!'),
       duration: const Duration(milliseconds: 300),
     ));
     debugPrint("no wrong");
   }
   
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex=(_currentQuestionIndex+1)%questionBank.length;
    });

  }
}

import 'package:flutter/material.dart';
import './questao.dart';
import './resposta.dart';

main()=>runApp(PerguntaApp());


class _PerguntaAppState extends State<PerguntaApp>{
  var _perguntaSeleciona = 0;


  void _responder(){

    setState(() {
      _perguntaSeleciona++;
    });
    print('pergunta respondida');
  }

  @override
  Widget build(BuildContext context){
  
    final perguntas = [{
        'text':'Qual é a sua cor favorita?',
        'resposta':['Preto','Vermelho','Verde','Branco']
      },{
        'text':'Qual é o seu animal favorito?',
        'resposta':['Coelho','Cobra','Elefante','Leão']
      },{
        'text':'Qual é o seu instrutor favorito?',
        'resposta':['Maria','João','Leo','Pedro']
    }];

    List<String> respostas = perguntas[_perguntaSeleciona]['resposta'];
    // List<Widget> widgets =respostas.map((t) => Resposta(t, _responder)).toList();

    // for(String textResp in respostas){
    //   widgets.add(Resposta(textResp,_responder));
    // }
 
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Container(
            width: double.infinity,
            child: Text(
              'Pergutas App',
              textAlign: TextAlign.center,
              ),
          ),
        ),
        body: Column(
          children:[
            Questao(perguntas[_perguntaSeleciona]['text']),
            ...respostas.map((t) => Resposta(t, _responder)).toList(),
          ],
        ),
      ),
    );
  }

}


class PerguntaApp extends StatefulWidget{

  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}

import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/resultado.dart';

class HomeIMC extends StatefulWidget {
  const HomeIMC({Key? key}) : super(key: key);

  @override
  _HomeIMCState createState() => _HomeIMCState();
}

class _HomeIMCState extends State<HomeIMC> {
  TextEditingController _alturaController = TextEditingController();
  TextEditingController _pesoController = TextEditingController();

  // Limpar os campos da tela:
  void _limparCampos() {
    _alturaController.text = "";
    _pesoController.text = "";
  }

  void _btnCalcularIMC() {
    //Obtem os valores de altura e peso a partir dos controllers
    //dos campos de texto:
    double alt = double.parse(_alturaController.text);
    double pes = double.parse(_pesoController.text);

    var myImc = CalculadoraIMC(altura: alt, peso: pes);

    //Realiza a navegação para a próxima tela (resultado)
    //instanciando o widget ResultadoIMC e passando os parâmetros
    //necessários:
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ResultadoIMC(
                    calculoImc: myImc,
                  )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculando IMC'),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _limparCampos)
          ],
        ),
        
        // O widget SingleChildScrollView permite que o conteúdo da tela 
        // seja rolado e impede que os demais componentes sejam cortados.
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                // Logotipo da Calculadora
                Padding(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Image.asset(
                  'assets/imc.png', 
                  width: 80.0, 
                  height: 80.0,
                    )),

                // Campo para a Altura
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _alturaController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Altura'),
                  ),
                ),

                // Campo para o peso
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    controller: _pesoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'Peso'),
                  ),
                ),

                // Botão para efetuar o cálculo
                ElevatedButton(
                  onPressed: _btnCalcularIMC,
                  child: Text('Resultado IMC'),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:imc/imc.dart';

class ResultadoIMC extends StatefulWidget {
  final CalculadoraIMC calculoImc;
  const ResultadoIMC({super.key, required this.calculoImc});

  @override
  _ResultadoIMCState createState() => _ResultadoIMCState(imc: this.calculoImc);
}

class _ResultadoIMCState extends State<ResultadoIMC> {
  final CalculadoraIMC _calculoImc;
  late Color _corCategoriaImc;

  _ResultadoIMCState({required CalculadoraIMC imc}) : _calculoImc = imc;

  @override
  void initState() {
    super.initState();
    switch (_calculoImc.categoria) {
      case CategoriaIMC.AbaixoPeso:
        _corCategoriaImc = Colors.blue;
        break;
      case CategoriaIMC.PesoNormal:
        _corCategoriaImc = Colors.green;
        break;
      case CategoriaIMC.Sobrepeso:
        _corCategoriaImc = Colors.yellow;
        break;
      case CategoriaIMC.ObesidadeGrauI:
        _corCategoriaImc = Color.fromARGB(255, 210, 64, 255);
        break;
      case CategoriaIMC.ObesidadeGrauII:
        _corCategoriaImc = Colors.redAccent;
        break;
      case CategoriaIMC.ObesidadeGrauIII:
        _corCategoriaImc = Colors.red;
        break;
      case null:
        // Tratamento para o caso de categoria ser nulo (se necessário)
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return NovoWidget(corCategoria: _corCategoriaImc, imc: _calculoImc);
  }
}

class NovoWidget extends StatelessWidget {
  const NovoWidget({
    Key? key,
    required Color corCategoria,
    required CalculadoraIMC imc,
  }) : _corCategoria = corCategoria, _imc = imc, super(key: key);

  final Color _corCategoria;
  final CalculadoraIMC _imc;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do IMC'),
        backgroundColor: _corCategoria,
      ),

      // O widget SingleChildScrollView permite que o conteúdo da tela
      // seja rolado e impede que os demais componentes sejam cortados.
      body: SingleChildScrollView(
        child:          
          Center(
            child: Container(
                height: MediaQuery.of(context).size.height*0.8,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(color: _corCategoria, width: 9),
                    borderRadius: const BorderRadius.all(Radius.circular(10))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(_imc.imc.toStringAsPrecision(3),
                            style: const TextStyle(fontSize: 50, fontFamily: 'Roboto'))),

                    // Faixa na qual se encontra a pessoa conforme o IMC
                    // A cor do texto é personalizada conforme a faixa.
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Classificação:',
                          style: TextStyle(fontSize: 16, color: _corCategoria),
                        )),
                    Padding(
                        padding: const EdgeInsets.all(0),
                        child: Text(
                          '${_imc.categoria?.descricao}',
                          style: TextStyle(fontSize: 20, color: _corCategoria),
                        )),
                    // Adicionando a imagem no meio 
                    SizedBox(
                      width: 300, 
                      height: 200, 
                      child: Image.asset('assets/peso.png'),
                    ),
                    // Texto padrão de orientação ao usuário.
                    const Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Text(
                            'O seu IMC é um indicativo de sua condição de saúde em relação ao seu peso. '
                            'Lembre-se que manter uma alimentação balanceada e praticar exercícios físicos '
                            'regularmente são essenciais para a manutenção de uma boa saúde. ')),
                  ],
                ),
        ),
          ),
      ),
    );
  }
}

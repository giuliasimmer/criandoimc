// Enumeração para representar as diferentes categorias de IMC.
// ignore_for_file: constant_identifier_names, constant_pattern_never_matches_value_type, unnecessary_this

enum CategoriaIMC {
  AbaixoPeso,
  PesoNormal,
  Sobrepeso,
  ObesidadeGrauI,
  ObesidadeGrauII,
  ObesidadeGrauIII,
}

// Extensão aplicada à enumeração CategoriaIMC, para 
// adicionar propriedade de descrição.
extension CategoriaIMCExt on CategoriaIMC {
  String? get descricao {
    switch (this) {
      case CategoriaIMC.AbaixoPeso:
        return 'Abaixo do Peso';
      case CategoriaIMC.PesoNormal:
        return 'Peso Normal';
      case CategoriaIMC.Sobrepeso:
        return 'Sobrepeso'; 
      case CategoriaIMC.ObesidadeGrauI:
        return 'Obesidade Grau I';               
      case CategoriaIMC.ObesidadeGrauII:
        return 'Obesidade Grau II';
      case CategoriaIMC.ObesidadeGrauIII:
        return 'Obesidade Grau III';      
      default:
        return null;
    }
  }
  
}

/// Representa o IMC - Índice de Massa Corpórea.
/// 
class CalculadoraIMC{
  // Atributos da classe CalculadoraIMC, necessários para o cálculo do índice.
  double peso;
  double altura;

  // Construtor para receber os parâmetros.  
  CalculadoraIMC({required this.peso, required this.altura});

  // Propriedade que realiza o cálculo do índice.
  double get imc{
    return peso / (altura * altura);
  }

  // Propriedade que realizada a apuração da categoria conforme 
  // o índice calculado.
  CategoriaIMC? get categoria {
      double valorIMC = this.imc;

      if(valorIMC < 18.6) {
        return  CategoriaIMC.AbaixoPeso;
      }
      if(valorIMC >= 18.6 && valorIMC < 24.9) {
        return CategoriaIMC.PesoNormal;
      }
      if(valorIMC >= 24.9 && valorIMC < 29.9) {
        return CategoriaIMC.Sobrepeso;
      }
      if(valorIMC >= 29.9 && valorIMC < 34.9) {
        return CategoriaIMC.ObesidadeGrauI;
      }
      if(valorIMC >= 34.9 && valorIMC < 39.9) {
        return CategoriaIMC.ObesidadeGrauII;
      }
      if(valorIMC >= 40) {
        return CategoriaIMC.ObesidadeGrauIII;
      }

      return null;
  } 
}

// Nova classe para armazenar descrições para cada categoria de IMC.
/*
class DescricaoCategoriaIMC {
  static String? obterDescricao(CategoriaIMC categoria) {
    switch (categoria) {
      case CategoriaIMC.AbaixoPeso:
        return 'Você está abaixo do peso. Isso pode ser um sinal de que você não está se alimentando corretamente ou que pode haver algum problema de saúde. É importante procurar um médico ou nutricionista para avaliar sua condição de saúde.';
      case CategoriaIMC.PesoNormal:
        return 'Parabéns! Você está com o peso dentro da faixa considerada normal pela OMS. Continue mantendo uma alimentação balanceada e praticando exercícios físicos regularmente.';
      case CategoriaIMC.Sobrepeso:
        return 'Você está com sobrepeso. Isso pode aumentar o risco de desenvolver problemas de saúde, como hipertensão e diabetes. É importante procurar um médico ou nutricionista para receber orientações sobre como alcançar um peso saudável.';
      case CategoriaIMC.ObesidadeGrauI:
        return 'Você está com obesidade grau I. Isso aumenta o risco de desenvolver problemas de saúde, como hipertensão, diabetes, entre outros. É muito importante procurar um médico ou nutricionista para receber orientações sobre como alcançar um peso saudável.';
      case CategoriaIMC.ObesidadeGrauII:
        return 'Você está com obesidade grau II. Isso aumenta significativamente o risco de desenvolver problemas de saúde, como hipertensão, diabetes, entre outros. É crucial procurar um médico ou nutricionista para receber orientações sobre como alcançar um peso saudável.';
      case CategoriaIMC.ObesidadeGrauIII:
        return 'Você está com obesidade grau III, também conhecida como obesidade mórbida. Isso aumenta muito o risco de desenvolver problemas de saúde graves, como hipertensão, diabetes, doenças cardíacas, entre outros. É extremamente importante procurar um médico ou nutricionista imediatamente para receber orientações sobre como alcançar um peso saudável.';
      default:
        return null;
    }
  }
}
*/

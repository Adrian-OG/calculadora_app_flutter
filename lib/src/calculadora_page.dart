import 'package:flutter/material.dart';
import 'package:calculadora_app/src/model.dart';

class CalculadoraPage extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<CalculadoraPage> {
  var calculadora = new Calculadora(0.0, 0.0);
  double _respuesta = 0.0;
  final _estiloTexto = new TextStyle(fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2),
          children: <Widget>[
            Padding(
              child: Text(
                'RESULTADO: ',
                style: _estiloTexto,
              ),
              padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 10),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 160.0, vertical: 10),
              child: Text(
                '$_respuesta',
                style: _estiloTexto,
              ),
            ),
            _crearInputs(),
          ],
        ),
      ),
      floatingActionButton: _crearbotones(),
    );
  }

  Widget _crearbotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: _Sumar,
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.remove),
          onPressed: _Restar,
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: _Multiplicar,
        ),
        SizedBox(
          width: 5.0,
        ),
        FloatingActionButton(
          child: IconButton(
            icon: Image.asset(
              'resources/ic_dividir2.png',
              color: Colors.white,
            ),
          ),
          onPressed: _Multiplicar,
        ),
      ],
    );
  }

  Widget _crearInputs() {
    return Column(
      children: <Widget>[
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              hintText: 'Ingrese el primer valor',
              labelText: 'Primer Valor'),
          onChanged: (valor) {
            calculadora.seta = double.parse(valor);
            print(calculadora.geta);
          },
        ),
        Divider(
          height: 10.0,
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
              hintText: 'Ingrese el segundo valor',
              labelText: 'Segundo Valor'),
          onChanged: (valor) {
            calculadora.setb = double.parse(valor);
            print(calculadora.getb);
          },
        )
      ],
    );
  }

  void _Sumar() {
    setState(() {
      double res = calculadora.geta + calculadora.getb;
      _respuesta = res;
    });
  }

  void _Restar() {
    setState(() {
      double res = calculadora.geta - calculadora.getb;
      _respuesta = res;
    });
  }

  void _Multiplicar() {
    setState(() {
      double res = calculadora.geta * calculadora.getb;
      _respuesta = res;
    });
  }

  void _Dividir() {
    setState(() {
      double res = calculadora.geta / calculadora.getb;
      _respuesta = res;
    });
  }
}

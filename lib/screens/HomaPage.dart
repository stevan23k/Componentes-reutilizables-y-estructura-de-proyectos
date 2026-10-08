import 'package:compra/model/compra_model.dart';
import 'package:compra/screens/ResultadoScreen.dart';
import 'package:compra/services/compra_service.dart';
import 'package:compra/widgets/CustomButton.dart';
import 'package:compra/widgets/CustomContainer.dart';
import 'package:flutter/material.dart';

import '../widgets/CustomTextField.dart';

class HomePage extends StatefulWidget {
  const new({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController cntNombre = TextEditingController();
  TextEditingController precio = TextEditingController();
  TextEditingController cantidad = TextEditingController();
  TextEditingController descuento = TextEditingController();

  final CompraService _service = CompraService();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _validarTexto(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Este campo es obligatorio";
    }
    return null;
  }

  String? _validarNumero(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "Este campo es obligatorio";
    }
    if (double.tryParse(value.trim()) == null) {
      return "Ingrese un valor numérico";
    }
    return null;
  }

  String? _validarDescuento(String? value) {
    final error = _validarNumero(value);
    if (error != null) return error;
    final double numero = double.parse(value!.trim());
    if (numero < 0 || numero > 100) {
      return "El descuento debe estar entre 0 y 100";
    }
    return null;
  }

  void calcularCompra() {
    if (!_formKey.currentState!.validate()) return;

    final compra = CompraModel(
      nombreProducto: cntNombre.text.trim(),
      precio: double.parse(precio.text.trim()),
      cantidad: double.parse(cantidad.text.trim()),
      porcentajeDescuento: double.parse(descuento.text.trim()),
    );

    final resultado = _service.calcularTotal(compra);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => ResultadoScreen(resultado: resultado)),
    );

    _formKey.currentState!.reset();
    cntNombre.clear();
    precio.clear();
    cantidad.clear();
    descuento.clear();
  }

  @override
  void dispose() {
    cntNombre.dispose();
    precio.dispose();
    cantidad.dispose();
    descuento.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registrar producto")),
      body: CustomContainer(
        height: 800,
        width: 800,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomTextField(
                  placeholder: "Nombre del producto",
                  typeKB: TextInputType.text,
                  cnt: cntNombre,
                  validator: _validarTexto,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  placeholder: "Precio",
                  typeKB: TextInputType.number,
                  cnt: precio,
                  validator: _validarNumero,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  placeholder: "Cantidad",
                  typeKB: TextInputType.number,
                  cnt: cantidad,
                  validator: _validarNumero,
                ),
                const SizedBox(height: 12),
                CustomTextField(
                  placeholder: "Porcentaje de descuento",
                  typeKB: TextInputType.number,
                  cnt: descuento,
                  isPorcent: true,
                  validator: _validarDescuento,
                ),
                const SizedBox(height: 20),
                CustomButton(placeholder: "Calcular", onClick: calcularCompra),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

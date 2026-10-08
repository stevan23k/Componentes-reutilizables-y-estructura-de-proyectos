import 'package:compra/model/compra_model.dart';
import 'package:compra/widgets/CustomButton.dart';
import 'package:compra/widgets/CustomContainer.dart';
import 'package:flutter/material.dart';

class ResultadoScreen extends StatelessWidget {
  final ResultadoCompra resultado;

  const new({super.key, required this.resultado});

  String _moneda(double valor) => '\$${valor.toStringAsFixed(2)}';

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colors = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Resultado de compra")),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: CustomContainer(
            height: 800,
            width: 800,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CircleAvatar(
                  radius: 32,
                  backgroundColor: colors.primaryContainer,
                  child: Icon(
                    Icons.receipt_long,
                    size: 34,
                    color: colors.onPrimaryContainer,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "Resumen de la compra",
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium,
                ),
                const SizedBox(height: 4),
                Text(
                  resultado.compra.nombreProducto,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colors.primary,
                  ),
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 8),
                _Fila(
                  label: "Precio unitario",
                  valor: _moneda(resultado.compra.precio),
                ),
                _Fila(
                  label: "Cantidad",
                  valor: resultado.compra.cantidad.toStringAsFixed(0),
                ),
                _Fila(label: "Subtotal", valor: _moneda(resultado.subtotal)),
                _Fila(
                  label:
                      "Descuento (${resultado.compra.porcentajeDescuento.toStringAsFixed(0)}%)",
                  valor: "- ${_moneda(resultado.descuento)}",
                  color: colors.error,
                ),
                const SizedBox(height: 8),
                const Divider(),
                const SizedBox(height: 8),
                _Fila(
                  label: "Total a pagar",
                  valor: _moneda(resultado.total),
                  destacado: true,
                ),
                const SizedBox(height: 24),
                CustomButton(
                  placeholder: "Regresar",
                  onClick: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Fila extends StatelessWidget {
  final String label;
  final String valor;
  final bool destacado;
  final Color? color;

  const _Fila({
    required this.label,
    required this.valor,
    this.destacado = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final TextStyle? estilo = destacado
        ? theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: theme.colorScheme.primary,
          )
        : theme.textTheme.bodyLarge;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: theme.textTheme.bodyMedium),
          Text(valor, style: estilo?.copyWith(color: color ?? estilo.color)),
        ],
      ),
    );
  }
}

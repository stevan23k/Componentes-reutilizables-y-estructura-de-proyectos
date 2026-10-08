import '../model/compra_model.dart';

class CompraService {
  ResultadoCompra calcularTotal(CompraModel compra) {
    final double subtotal = compra.precio * compra.cantidad;
    final double validPercentage = compra.porcentajeDescuento.clamp(0.0, 100.0);
    final double descuento = subtotal * (validPercentage / 100);
    final double total = subtotal - descuento;

    return ResultadoCompra(
      compra: compra,
      subtotal: double.parse(subtotal.toStringAsFixed(2)),
      descuento: double.parse(descuento.toStringAsFixed(2)),
      total: double.parse(total.toStringAsFixed(2)),
    );
  }
}

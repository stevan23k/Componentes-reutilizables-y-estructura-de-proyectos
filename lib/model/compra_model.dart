class CompraModel {
  final String nombreProducto;
  final double precio;
  final double cantidad;
  final double porcentajeDescuento;

  const CompraModel({
    required this.nombreProducto,
    required this.precio,
    required this.cantidad,
    required this.porcentajeDescuento,
  });
}

class ResultadoCompra {
  final CompraModel compra;
  final double subtotal;
  final double descuento;
  final double total;

  const ResultadoCompra({
    required this.compra,
    required this.subtotal,
    required this.descuento,
    required this.total,
  });
}

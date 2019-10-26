using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class DetalleCompra
    {
        public int Id { get; set; }
        public Producto Producto { get; set; }
        public float PrecioUnitario { get; set; }
        public int Cantidad { get; set; }
        public float Total { get; set; }
        public float Subtotal { get; set; }
        public int CodigoFactura { get; set; }
        public float Iva { get; set; }
    }
}

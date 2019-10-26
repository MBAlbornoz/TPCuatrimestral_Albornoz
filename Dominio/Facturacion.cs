using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Facturacion
    {
        public int Codigo { get; set; }
        public TipoFactura TipoFactura { get; set; }
        public MedioPago MedioPago { get; set; }
        public Empresa Empresa { get; set; }
        public Cliente Cliente { get; set; }
        public Vendedor Vendedor { get; set; }
        public DateTime Fecha { get; set; }
        public float Total { get; set; }
        public float Subtotal { get; set; }
        public string Nota { get; set; }
        public DetalleVenta[] DetalleVentas { get; set; }
    }
}

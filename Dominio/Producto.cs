using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Producto
    {
        public int Codigo { get; set; }
        public string Descripcion { get; set; }
        public string Imagen { get; set; }
        public Marca Marca { get; set; }
    }
}

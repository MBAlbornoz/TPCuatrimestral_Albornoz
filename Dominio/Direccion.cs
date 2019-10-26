using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Direccion
    {
        public int Id { get; set; }
        public string Descripcion { get; set; }
        public int Numero { get; set; }
        public string Ciudad { get; set; }
        public string Provincia { get; set; }
        public string Pais { get; set; }
    }
}

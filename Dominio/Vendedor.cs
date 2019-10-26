using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Vendedor : Persona
    {
        public int Codigo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaRegistro { get; set; }
        public char Sexo { get; set; }
        public Usuario Usuario { get; set; }
    }
}

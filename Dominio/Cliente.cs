using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Cliente : Persona
    {
        public int Codigo { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public DateTime FechaRegistro { get; set; }
        public char Sexo { get; set; }
    }
}

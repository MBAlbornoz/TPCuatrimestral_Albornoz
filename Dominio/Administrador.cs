using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Administrador : Persona
    {
        public int Codigo { get; set; }
        public Usuario Usuario { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Text;

namespace Dominio
{
    public class Persona
    {
        public int Id { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public int Dni_Cuit { get; set; }
        public string Imagen { get; set; }
        public Telefono Telefono { get; set; } 
        public Email Email { get; set; }
        public Direccion Direccion { get; set; }
    }
}

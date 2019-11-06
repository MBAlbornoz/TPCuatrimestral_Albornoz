using System;
using System.Collections.Generic;
using System.Text;
using Dominio;

namespace Negocio
{
    public class NegocioCliente
    {
        public List<Cliente> listarClientes()
        {

            AccesoDatos datos = new AccesoDatos();
            try
            {
                String query = "SELECT Id, DNI, Nombre, Apellido, Email, Direccion, Ciudad, CodigoPostal, Telefono, FechaRegistro FROM Clientes";
                datos.seterQuery(query);
                List<Cliente> listarClientes = new List<Cliente>();
                Cliente aux;
                datos.EjecutarLector();

                while (datos.SqlDataReader.Read())
                {
                    aux = new Cliente();
                    aux.Dni_Cuit = (int)datos.SqlDataReader["DNI"];
                    aux.Apellido = (String)datos.SqlDataReader["Apellido"].ToString();
                    aux.Nombre = (String)datos.SqlDataReader["Nombre"].ToString();
                    aux.Sexo = (char)datos.SqlDataReader["Sexo"];
                    aux.Imagen = (String)datos.SqlDataReader["Imagen"].ToString();
                    aux.FechaRegistro = (DateTime)datos.SqlDataReader["FechaRegistro"];
                    aux.FechaNacimiento = (DateTime)datos.SqlDataReader["FechaNacimiento"];
                   //Direccion
                    aux.Direccion.NombreDireccion = (String)datos.SqlDataReader["Direccion"];
                    aux.Direccion.Numero=(int)datos.SqlDataReader["Numero"];
                    aux.Direccion.Ciudad=(String)datos.SqlDataReader["Ciudad"];
                    aux.Direccion.Provincia=(String)datos.SqlDataReader["Provincia"];
                    aux.Direccion.Pais=(String)datos.SqlDataReader["Pais"];
                    //Telefono
                    aux.Telefono.Numero = (int)datos.SqlDataReader["Telefono"]; //HACER EL SP PARA QUE SELECCIONE SOLO EL TELEFONO PARA ESTE CLIENTE
                   //Email
                    aux.Email.DireccionEmail = (String)datos.SqlDataReader["Email"].ToString(); //HACER EL SP PARA QUE SELECCIONE SOLO EL EMAIL PARA ESTE CLIENTE


                    listarClientes.Add(aux);
                }
                datos.CerrarConexionDB();
                return listarClientes;
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public Cliente buscarCliente(int dni)
        {
            Cliente datosCliente = new Cliente();
            //EN CASO DE NO EXISTIR DEVUELVE UN REGISTRO NULL
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.seterQuery("Select c.nombre,c.apellido,c.dni_cuit,c.imagen,c.sexo,c.fechaNacimiento,c.fechaRegistro,d.direccion, d.numero, d.departamento, d.ciudad, d.provincia, d.pais, e.email, t.numero from Clientes as c left join Direcciones as d on c.id=d.id left join Emails as e on c.id=e.id left join Telefonos as t on c.id=t.id");

                Cliente cliente;
                datos.EjecutarLector();

                while (datos.SqlDataReader.Read())
                {
                    cliente = new Cliente
                    {
                        Dni_Cuit = (int)datos.SqlDataReader["c.dni_cuit"]
                    };
                    if (cliente.Dni_Cuit == dni)
                    {
                        cliente = new Cliente();
                        cliente.Dni_Cuit = Convert.ToInt32(datos.SqlDataReader["c.dni_cuit"]);
                        cliente.Apellido = (String)datos.SqlDataReader["c.apellido"].ToString();
                        cliente.Nombre = (String)datos.SqlDataReader["c.nombre"].ToString();
                        cliente.Imagen = (String)datos.SqlDataReader["c.imagen"].ToString();
                        cliente.Sexo = (char)datos.SqlDataReader["c.sexo"];
                        cliente.Imagen = (String)datos.SqlDataReader["c.magen"].ToString();
                        cliente.FechaRegistro = (DateTime)datos.SqlDataReader["c.fechaRegistro"];
                        cliente.FechaNacimiento = (DateTime)datos.SqlDataReader["c.fechaNacimiento"];
                        //Direccion
                        cliente.Direccion.NombreDireccion = (String)datos.SqlDataReader["d.direccion"];
                        cliente.Direccion.Numero = Convert.ToInt32(datos.SqlDataReader["d.numero"]);
                        //Falta Departamento
                        cliente.Direccion.Ciudad = (String)datos.SqlDataReader["d.ciudad"];
                        cliente.Direccion.Provincia = (String)datos.SqlDataReader["d.provincia"];
                        cliente.Direccion.Pais = (String)datos.SqlDataReader["d.pais"];
                        //Telefono
                        cliente.Telefono.Numero = Convert.ToInt32(datos.SqlDataReader["t.numero"]); //HACER EL SP PARA QUE SELECCIONE SOLO EL TELEFONO PARA ESTE CLIENTE
                                                                                        //Email
                        cliente.Email.DireccionEmail = (String)datos.SqlDataReader["e.email"].ToString(); //HACER EL SP PARA QUE SELECCIONE SOLO EL EMAIL PARA ESTE CLIENTE
                        
                        datosCliente = cliente;
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexionDB();
            }
            return datosCliente;
        }
        public void altaCliente(Cliente cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.seterQuery("INSERT INTO Clientes (Nombre, Apellido,Dni_cuit, Imagen, Sexo,FechaNacimiento, FechaRegistro, IdDireccion, IdTelefono, IdEmail) VALUES (@Nombre,@Apellido,@Dni_cuit,@Imagen,@Sexo,@FechaNacimiento,@FechaRegistro,@IdDireccion,@IdTelefono,@IdEmail)");

                datos.AgregarParametro("@Nombre", cliente.Nombre);
                datos.AgregarParametro("@Apellido", cliente.Apellido);
                datos.AgregarParametro("@Dni_cuit", cliente.Dni_Cuit);
                datos.AgregarParametro("@Imagen", cliente.Imagen);
                datos.AgregarParametro("@Sexo", cliente.Sexo);
                datos.AgregarParametro("@FechaNacimiento", cliente.FechaNacimiento);
                datos.AgregarParametro("@FechaRegistro", DateTime.UtcNow);
                datos.AgregarParametro("@IdDireccion", cliente.Direccion.Id);
                datos.AgregarParametro("@IdTelefono", cliente.Telefono.Id);
                datos.AgregarParametro("@IdEmail", cliente.Email.Id);


                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }

        }

        public void actualizarCliente(Cliente cliente)
        {
            AccesoDatos datos = new AccesoDatos();
            try
            {
                datos.seterQuery("UPDATE Clientes SET Nombre=@Nombre, Apellido=@Apellido ,Dni_cuit=0@Dni_cuit , Imagen=@Imagen, Sexo=@Sexo ,FechaNacimiento=@FechaNacimiento, FechaRegistro=@FechaRegistro, IdDireccion=@IdDireccion, IdTelefono=@IdTelefono, IdEmail=@IdEmail WHERE Id=@Id ");

                datos.AgregarParametro("@Nombre", cliente.Nombre);
                datos.AgregarParametro("@Apellido", cliente.Apellido);
                datos.AgregarParametro("@Dni_cuit", cliente.Dni_Cuit);
                datos.AgregarParametro("@Imagen", cliente.Imagen);
                datos.AgregarParametro("@Sexo", cliente.Sexo);
                datos.AgregarParametro("@FechaNacimiento", cliente.FechaNacimiento);
                datos.AgregarParametro("@FechaRegistro", DateTime.UtcNow);
                datos.AgregarParametro("@IdDireccion", cliente.Direccion.Id);
                datos.AgregarParametro("@IdTelefono", cliente.Telefono.Id);
                datos.AgregarParametro("@IdEmail", cliente.Email.Id);
                datos.AgregarParametro("@Id", cliente.Id);

                datos.EjecutarAccion();

            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                datos.CerrarConexionDB();
            }

        }
    }
}

using System;
using System.Collections.Generic;
using System.Text;
using System.Data.SqlClient;

namespace Negocio
{
    public class AccesoDatos
    {


        public SqlDataReader SqlDataReader { get; set; }
        public SqlConnection SqlConnection { get; set; }
        public SqlCommand SqlCommand { get; set; }



        public AccesoDatos()
        {
            SqlConnection = new SqlConnection("data source=.\\SQLEXPRESS;initial catalog=ALBORNOZ_DB;integrated security=sspi");
            SqlCommand = new SqlCommand
            {
                Connection = SqlConnection
            };

        }

        public void seterQuery(String query)
        {
            SqlCommand.CommandType = System.Data.CommandType.Text;
            SqlCommand.CommandText = query;
        }

        public void EjecutarLector()
        {
            try
            {
                //ABRE LA CONEXION
                SqlConnection.Open();
                //LEE LA NON QUERY
                SqlDataReader = SqlCommand.ExecuteReader();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        public void EjecutarAccion()
        {
            try
            {
                SqlConnection.Open();
                SqlCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                SqlConnection.Close();
            }
        }

        //CIERRA LA CONEXION CON LA BASE DE DATOS SLSERVER
        public void CerrarConexionDB()
        {
            SqlConnection.Close();
        }

        public void AgregarParametro(string nombre, object valor)
        {
            SqlCommand.Parameters.AddWithValue(nombre, valor);
        }


    }
}

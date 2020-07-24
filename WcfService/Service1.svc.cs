using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de clase "Service1" en el código, en svc y en el archivo de configuración.
    // NOTE: para iniciar el Cliente de prueba WCF para probar este servicio, seleccione Service1.svc o Service1.svc.cs en el Explorador de soluciones e inicie la depuración.
    public class Service1 : IService1
    {
        public List<Tarea>Listar()
        {
            SqlCommand cmd;
            string connectionString = ConfigurationManager.ConnectionStrings["BDatos"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            cn.Open();
            List<Tarea> list = new List<Tarea>();
            try
            {
                cmd = new SqlCommand("SPM_Listar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    int ide = Convert.ToInt32(reader[0]);
                    string descrip = reader[1].ToString().Trim();
                    bool est = Convert.ToBoolean(reader[2]);

                    list.Add(new Tarea()
                    {
                        id= ide,
                        descripcion = descrip,
                        estado = est
                    });
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return list;
        }

        public bool Agregar(string descripcion, bool estado)
        {
            SqlCommand cmd;
            string connectionString = ConfigurationManager.ConnectionStrings["BDatos"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            cn.Open();
            bool msje = true;
            try
            {
                cmd = new SqlCommand("SPM_Agregar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@descripcion", descripcion);
                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return msje;
        }

        public DataSet ListarId(int id)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["BDatos"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            cn.Open();
            DataSet ds = new DataSet();
            try
            {
                SqlCommand cmd = new SqlCommand("SPM_ListarId", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_tarea", id);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                cmd.ExecuteNonQuery();
            }
            catch(Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
            }

            return ds;
        }

        public bool Editar(int id, string descripcion, bool estado)
        {
            SqlCommand cmd;
            string connectionString = ConfigurationManager.ConnectionStrings["BDatos"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            cn.Open();
            bool msje = true;
            try
            {
                cmd = new SqlCommand("SPM_Editar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_tarea", id);
                cmd.Parameters.AddWithValue("@descripcion", descripcion);
                cmd.Parameters.AddWithValue("@estado", estado);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return msje;
        }

        public bool Eliminar(int id)
        {
            SqlCommand cmd;
            string connectionString = ConfigurationManager.ConnectionStrings["BDatos"].ConnectionString;
            SqlConnection cn = new SqlConnection(connectionString);
            cn.Open();
            bool msje = true;
            try
            {
                cmd = new SqlCommand("SPM_Eliminar", cn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id_tarea", id);
                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            finally
            {
                cn.Close();
            }
            return msje;
        }
    }
}

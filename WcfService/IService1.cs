using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.ServiceModel.Web;
using System.Text;

namespace WcfService
{
    // NOTA: puede usar el comando "Rename" del menú "Refactorizar" para cambiar el nombre de interfaz "IService1" en el código y en el archivo de configuración a la vez.
    [ServiceContract]
    public interface IService1
    {

        [OperationContract]
        [WebInvoke(Method = "GET", UriTemplate = "Listar?estado={estado}",
            RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        List<Tarea>Listar();

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Agregar?descripcion={descripcion}&estado={estado}",
            RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        bool Agregar(string descripcion, bool estado);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Editar?id={id}&descripcion={descripcion}&estado={estado}",
            RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        bool Editar(int id, string descripcion, bool estado);

        [OperationContract]
        [WebInvoke(Method = "POST", UriTemplate = "ListarId?estado={estado}",
            RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        DataSet ListarId(int id);

        [OperationContract]
        [WebInvoke(Method = "PUT", UriTemplate = "Eliminar?id={id}",
            RequestFormat = WebMessageFormat.Json, ResponseFormat = WebMessageFormat.Json, BodyStyle = WebMessageBodyStyle.Bare)]
        bool Eliminar(int id);
        // TODO: agregue aquí sus operaciones de servicio
    }


    // Utilice un contrato de datos, como se ilustra en el ejemplo siguiente, para agregar tipos compuestos a las operaciones de servicio.
    [DataContract]
    public class Tarea
    {
        [DataMember]
        public int id { get; set; }

        [DataMember]
        public string descripcion {get; set;}

        [DataMember]
        public bool estado { get; set; }
    }
}

namespace MVVM.Model.DAL
{
    using System.IO;
    using System.Xml.Serialization;

    public class Serializer
    {
        public T Deserialize<T> (string input) where T : class
        {
            XmlSerializer xmlSerializer = new XmlSerializer(typeof(T));
            using(StringReader reader = new StringReader(input))
            {
                return (T)xmlSerializer.Deserialize(reader);
            }
        }

        public string Serialize<T>(T ObjectToSerialize)
        {
            XmlSerializer xmlSerializer = new XmlSerializer(ObjectToSerialize.GetType());
            using(StringWriter stringWriter = new StringWriter())
            {
                xmlSerializer.Serialize(stringWriter, ObjectToSerialize);
                return stringWriter.ToString();
            }
        }
    }
}

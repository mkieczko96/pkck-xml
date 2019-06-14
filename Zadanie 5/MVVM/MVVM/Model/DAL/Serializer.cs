namespace MVVM.Model.DAL
{
    using System.IO;
    using System.Text;
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
            
            using(StringWriterUtf8 stringWriter = new StringWriterUtf8())
            {
                xmlSerializer.Serialize(stringWriter, ObjectToSerialize);
                return stringWriter.ToString();
            }
        }

        public class StringWriterUtf8 : System.IO.StringWriter
        {
            public override Encoding Encoding
            {
                get
                {
                    return Encoding.UTF8;
                }
            }
        }
    }
}

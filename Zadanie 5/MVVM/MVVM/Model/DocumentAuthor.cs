namespace MVVM.Model
{
    using System.ComponentModel;
    using System.Xml.Serialization;

    public class DocumentAuthor
    {
        [XmlElement("lastname")]
        public string LastName { get; set; }

        [XmlElement("firstname")]
        public string FirstName { get; set; }

        [XmlElement("index")]
        public int Index { get; set; }

        [XmlElement("e-mail")]
        public string Email { get; set; }

        [XmlElement("faculty")]
        public string Faculty { get; set; }

        [XmlElement("major")]
        public string Major { get; set; }

        [XmlElement("department")]
        public string Department { get; set; }
        
    }
}

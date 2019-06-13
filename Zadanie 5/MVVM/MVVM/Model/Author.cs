namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Author
    {
        [XmlAttribute("authorID")]
        public string AuthorID { get; set; }

        [XmlElement("lastname")]
        public string LastName { get; set; }

        [XmlElement("firstname")]
        public string FirstName { get; set; }
    }
}

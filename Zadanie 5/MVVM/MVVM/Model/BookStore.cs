namespace MVVM.Model
{
    using System.Xml.Serialization;

    [XmlRoot("bookstore")]
    public class BookStore
    {
        [XmlElement("creators")]
        public Creators Creators { get; set; }

        [XmlElement("library")]
        public Library Library { get; set; }

        [XmlElement("summary")]
        public Summary Summary { get; set; }
    }
}

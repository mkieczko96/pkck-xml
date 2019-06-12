namespace MVVM.Model
{
    using System.Collections.Generic;
    using System.Xml.Serialization;

    public class Library
    {
        [XmlElement("book")]
        public List<Book> Books { get; set; }
    }
}

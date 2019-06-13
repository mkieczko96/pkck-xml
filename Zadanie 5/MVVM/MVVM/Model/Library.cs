namespace MVVM.Model
{
    using System.Collections.Generic;
    using System.Xml.Serialization;

    [XmlRoot("library")]
    public class Library
    {
        [XmlElement("document-authors")]
        public DocumentAuthors DocumentAuthors { get; set; }

        [XmlElement("book")]
        public List<Book> Books { get; set; }

        [XmlElement("author")]
        public List<Author> Authors { get; set; }
    }
}

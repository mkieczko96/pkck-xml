namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Category
    {
        [XmlAttribute("name")]
        public string Name { get; set; }

        [XmlAttribute("booksCount")]
        public int BooksCount { get; set; }
    }
}

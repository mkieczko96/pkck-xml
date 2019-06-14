namespace MVVM.Model
{
    using System.Collections.Generic;
    using System.Collections.ObjectModel;
    using System.ComponentModel;
    using System.Xml.Serialization;

    [XmlRoot("library")]
    public class Library : BaseModel
    {
        [XmlElement("document-authors")]
        public DocumentAuthors DocumentAuthors { get; set; }

        private ObservableCollection<Book> books;

        [XmlElement("book")]
        public ObservableCollection<Book> Books
        {
            get
            {
                return books;
            }

            set
            {
                books = value;
                base.OnPropertyChanged("books");
            }
        }

        [XmlElement("author")]
        public List<Author> Authors { get; set; }

    }
}

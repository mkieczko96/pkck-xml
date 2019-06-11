namespace MVVM.Model
{
    using System.Collections.Generic;

    public class Library
    {
        public List<DocumentAuthor> DocumentAuthors { get; set; }
        public List<Book> Books { get; set; }
        public List<Author> Authors { get; set; }

        public Library(List<DocumentAuthor> documentAuthors, List<Book> books, List<Author> authors)
        {
            DocumentAuthors = documentAuthors;
            Books = books;
            Authors = authors;
        }

    }
}

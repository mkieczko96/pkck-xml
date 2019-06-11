namespace MVVM.Model
{
    public class Book
    {
        public string BookID { get; set; }
        public Author Author { get; set; }
        public string Title { get; set; }
        public string Publisher { get; set; }
        public int PageCount { get; set; }
        public float Price { get; set; }
        public string ReleaseDate { get; set; }
        public string Category { get; set; }

        public Book(string bookID, Author author, string title, string publisher, int pageCount, float price, string releaseDate, string category)
        {
            BookID = bookID;
            Author = author;
            Title = title;
            Publisher = publisher;
            PageCount = pageCount;
            Price = price;
            ReleaseDate = releaseDate;
            Category = category;
        }
    }
}

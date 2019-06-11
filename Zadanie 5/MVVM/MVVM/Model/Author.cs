namespace MVVM.Model
{
    public class Author
    {
        public string AuthorID { get; set; }
        public string LastName { get; set; }
        public string FirstName { get; set; }

        public Author(string authorID, string lastName, string firstName)
        {
            AuthorID = authorID;
            LastName = lastName;
            FirstName = firstName;
        }
    }
}

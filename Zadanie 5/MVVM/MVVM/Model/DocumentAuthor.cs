namespace MVVM.Model
{
    public class DocumentAuthor
    {
        public string LastName { get; set; }
        public string FirstName { get; set; }
        public int Index { get; set; }
        public string Email { get; set; }
        public string Faculty { get; set; }
        public string Major { get; set; }
        public string Department { get; set; }

        public DocumentAuthor(string lastName, string firstName, int index, string email, string faculty, string major, string department)
        {
            LastName = lastName;
            FirstName = firstName;
            Index = index;
            Email = email;
            Faculty = faculty;
            Major = major;
            Department = department;
        }

    }
}

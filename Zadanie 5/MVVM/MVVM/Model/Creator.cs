namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Creator
    {
        public Creator(string name, int index, string email, string study)
        {
            Name = name;
            Index = index;
            Email = email;
            Study = study;
        }

        [XmlElement("name")]
        public string Name { get; set; }

        [XmlElement("index")]
        public int Index { get; set; }

        [XmlElement("e-mail")]
        public string Email { get; set; }

        [XmlElement("study")]
        public string Study { get; set; }
    }
}

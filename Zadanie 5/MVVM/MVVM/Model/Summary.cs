namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Summary
    {
        [XmlElement("categories")]
        public Categories Categories { get; set; }

        [XmlElement("date_generated")]
        public string DateGenerated { get; set; }
    }
}

namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Price
    {
        [XmlElement("price")]
        public double Value { get; set; }

        [XmlAttribute("currency")]
        public string Currency { get; set; }
    }
}

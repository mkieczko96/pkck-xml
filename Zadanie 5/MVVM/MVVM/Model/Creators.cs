namespace MVVM.Model
{
    using System.Collections.Generic;
    using System.Xml.Serialization;

    public class Creators
    {
        [XmlElement("creator")]
        public List<string> DocumentCreators { get; set; }
    }
}

using System.Collections.Generic;
    using System.ComponentModel;
using System.Xml.Serialization;

namespace MVVM.Model
{
    public class DocumentAuthors
    {
        [XmlElement("document-author")]
        public List<DocumentAuthor> DocumentAuthorsRepo { get; set; }
    }
}

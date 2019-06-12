namespace MVVM.Model
{
    using System.Collections.Generic;
    using System.Xml.Serialization;

    public class Categories
    {
        [XmlElement("category")]
        public List<Category> CategoriesSummary { get; set; }
    }
}

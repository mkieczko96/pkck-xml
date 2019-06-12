﻿namespace MVVM.Model
{
    using System.Xml.Serialization;

    public class Book
    {
        [XmlElement("title")]
        public string Title { get; set; }

        [XmlElement("category")]
        public string Category { get; set; }

        [XmlElement("author")]
        public string Author { get; set; }

        [XmlElement("isbn")]
        public string ISBN { get; set; }

        [XmlElement("price")]
        public Price Price { get; set; }

        [XmlElement("release_date")]
        public string ReleaseDate { get; set; }

        [XmlElement("page_count")]
        public int PageCount { get; set; }

        [XmlElement("publisher")]
        public string Publisher { get; set; }
    }
}

using MVVM.Model;
using MVVM.Model.DAL;
using System.ComponentModel;
using System.IO;
using System.Windows.Input;
using System.Text;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Xml;
using System.Xml.Xsl;

namespace MVVM.ViewModel
{
    public class LibraryViewModel : INotifyPropertyChanged
    {
        private string filePath = @"D:\Semestr6\XML\Zadanie 5\MVVM\MVVM\Database";

        private Library library;

        public Library Library
        {
            get
            {
                return library;
            }

            set
            {
                library = value;
                OnPropertyChanged(nameof(library));
            }
        }

        private Book selectedBook = null;

        public Book SelectedBook
        {
            get
            {
                return selectedBook;
            }

            set
            {
                selectedBook = value;
                OnPropertyChanged(nameof(selectedBook));
            }
        }

        private ObservableCollection<Book> books;

        public ObservableCollection<Book> Books
        {
            get
            {
                return books;
            }

            set
            {
                books = value;
                OnPropertyChanged(nameof(books));
            }
        }

        public LibraryViewModel()
        {
            Serializer ser = new Serializer();
            string xml = File.ReadAllText(Path.Combine(filePath, "library.xml"));
            Library = ser.Deserialize<Library>(xml);
            Books = Library.Books;
        }

        public void Save()
        {
            Serializer ser = new Serializer();
            string xml = ser.Serialize<Library>(Library);
            File.WriteAllText(Path.Combine(filePath, "library.xml"), xml);
        }

        private void ToHelperXML()
        {
            XslCompiledTransform xslTransform = new XslCompiledTransform();
            xslTransform.Load(Path.Combine(filePath, "XSLT" ,"ToXml.xsl"));
            xslTransform.Transform(Path.Combine(filePath, "library.xml"), Path.Combine(filePath, "Output", "helper.xml"));
        }

        public void ToXhtml()
        {
            ToHelperXML();
            XslCompiledTransform xslTransform = new XslCompiledTransform();
            xslTransform.Load(Path.Combine(filePath, "XSLT", "ToXhtml.xsl"));
            xslTransform.Transform(Path.Combine(filePath, "Output", "helper.xml"), Path.Combine(filePath, "Output", "index.html"));
        }

        public void ToSVG()
        {
            ToHelperXML();
            XslCompiledTransform xslTransform = new XslCompiledTransform();
            xslTransform.Load(Path.Combine(filePath, "XSLT", "ToSvg.xsl"));
            xslTransform.Transform(Path.Combine(filePath, "Output", "helper.xml"), Path.Combine(filePath, "Output", "image.svg"));
        }

        public event PropertyChangedEventHandler PropertyChanged;

        private void OnPropertyChanged(params string[] args)
        {
            if (PropertyChanged != null)
            {
                foreach (string arg in args)
                {
                    PropertyChanged(this, new PropertyChangedEventArgs(arg));
                }
                Save();
            }
        }

        private ICommand clearSelection;
        private ICommand addNew;
        private ICommand removeBook;
        private ICommand toXhtml;
        private ICommand toSvg;

        public ICommand ClearSelection
        {
            get
            {
                if (clearSelection == null)
                {
                    clearSelection = new RelayCommand(
                        arg =>
                        {
                            SelectedBook = new Book();
                        },
                        arg => ((SelectedBook != null)));
                }
                return clearSelection;
            }
        }

        public ICommand AddNew
        {
            get
            {
                if (addNew == null)
                {
                    addNew = new RelayCommand(
                        arg =>
                        {
                            Library.Books.Add(SelectedBook);
                            Save();
                        },
                        arg => (SelectedBook != null) &&
                                (SelectedBook.ISBN != null) &&
                                !Library.Books.Contains(SelectedBook));
                }
                return addNew;
            }
        }

        public ICommand RemoveBook
        {
            get
            {
                if(removeBook == null)
                {
                    removeBook = new RelayCommand(
                        arg =>
                        {
                            Books.Remove(SelectedBook);
                            Save();
                        },
                        arg => SelectedBook != null);
                }
                return removeBook;
            }
        }

        public ICommand ToXHTML
        {
            get
            {
                if(toXhtml == null)
                {
                    toXhtml = new RelayCommand(
                        arg =>
                        {
                            ToXhtml();
                        });
                }
                return toXhtml;
            }
        }

        public ICommand ToSvg
        {
            get
            {
                if (toSvg == null)
                {
                    toSvg = new RelayCommand(
                        arg =>
                        {
                            ToSVG();
                        });
                }
                return toSvg;
            }
        }
    }
}

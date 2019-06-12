using System.IO;
using System.Windows;

namespace MVVM.View
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();


            Model.DAL.Serializer ser = new Model.DAL.Serializer();

            string inputData = File.ReadAllText(@"C:\Users\mateusz.kieczkowski\OneDrive - Accenture\Desktop\pkck-xml\Zadanie 5\MVVM\MVVM\Database\helper.xml");

            Model.BookStore bs = ser.Deserialize<Model.BookStore>(inputData);

        }
    }
}

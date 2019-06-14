using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MVVM.Model
{
    public abstract class BaseModel : INotifyPropertyChanged
    {
        public event PropertyChangedEventHandler PropertyChanged;

        protected void OnPropertyChanged(params string[] args)
        {
            if (PropertyChanged != null)
            {
                foreach (string arg in args)
                {
                    PropertyChanged(this, new PropertyChangedEventArgs(arg));
                }
            }
        }
    }
}

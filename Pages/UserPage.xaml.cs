using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using ToysStoreApp.Data;
using ToysStoreApp.Pages;

namespace ToysStoreApp
{
    /// <summary>
    /// Логика взаимодействия для UserPage.xaml
    /// </summary>
    public partial class UserPage : Page
    {
        public UserPage(User user)
        {
            InitializeComponent();
            txtBlockName.Text += user.Worker.Name;
            txtBlockSurname.Text += user.Worker.Surname;
            txtBlockRole.Text += user.TypeOfUser.Name;
            userImage.Source = new BitmapImage(new Uri($"/Resources/{user.TypeOfUser.Name}.png", UriKind.Relative));
        }
    }
}

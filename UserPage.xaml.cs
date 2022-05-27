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
            TextBlockLogin.Text += user.Login;
            TextBlockPassword.Text += user.Password;
            TextBlockRole.Text += user.TypeOfUser.Name;
            UserImage.Source = new BitmapImage(new Uri($"Resources/{user.TypeOfUser.Name}.jpg", UriKind.Relative));
        }
    }
}

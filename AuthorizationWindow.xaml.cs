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
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class AuthorizationWindow : Window
    {
        public AuthorizationWindow()
        {
            InitializeComponent();
        }

        private void ButtonLogin_Click(object sender, RoutedEventArgs e)
        {
            int count = 0;
            int userId = 0;
            foreach (var user in ToyStoreEntities.GetContext().User)
            {
                if (LoginBox.Text == user.Login && PasswordBox.Password == user.Password)
                {
                    count++;
                    userId = user.ID;
                    UserWindow userWindow = new UserWindow(user);
                    userWindow.Show();
                    this.Close();
                    break;
                }
                if(LoginBox.Text == user.Login)
                {
                    userId = user.ID;
                }
            }
            try 
            {
                if(count == 0 && userId != 0)
                {
                    SaveHistory("faled");
                    MessageBox.Show("Неверно");
                }
                else if(count == 1 && userId != 0)
                {
                    SaveHistory("success");
                    MessageBox.Show("Правильно");
                }
            }
            catch
            {

            }
        }

        private static void SaveHistory(string access)
        {
            HistoryOfEnter history = new HistoryOfEnter();
            history.LastEnter = DateTime.Now;
            history.Status = access;
            ToyStoreEntities.GetContext().HistoryOfEnter.Add(history);
            ToyStoreEntities.GetContext().SaveChanges();
        }
    }
}

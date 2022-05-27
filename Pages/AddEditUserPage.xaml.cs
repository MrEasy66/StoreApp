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

namespace ToysStoreApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditUserPage.xaml
    /// </summary>
    public partial class AddEditUserPage : Page
    {
        User _currentUser = new User();
        public AddEditUserPage(User selectedUser)
        {
            InitializeComponent();
            if (selectedUser != null)
                _currentUser = selectedUser;
            DataContext = _currentUser;
            comboBoxTypeId.ItemsSource = ToyStoreDBEntities.GetContext().TypeOfUser.ToList();
            comboBoxWorkerId.ItemsSource = ToyStoreDBEntities.GetContext().Worker.ToList();
            comboBoxClientId.ItemsSource = ToyStoreDBEntities.GetContext().Client.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentUser.Login))
                errors.AppendLine("Укажите логин пользователя");
            if (string.IsNullOrWhiteSpace(_currentUser.Password))
                errors.AppendLine("Укажите пароль пользователя");
            if (_currentUser.ID == 0)
                ToyStoreDBEntities.GetContext().User.Add(_currentUser);
            try
            {
                ToyStoreDBEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}

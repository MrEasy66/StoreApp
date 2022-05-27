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
    /// Логика взаимодействия для AddEditClientPage.xaml
    /// </summary>
    public partial class AddEditClientPage : Page
    {
        Client _currentClient = new Client();
        public AddEditClientPage(Client selectedClient)
        {
            InitializeComponent();
            if (selectedClient != null)
                _currentClient = selectedClient;
            DataContext = _currentClient;
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentClient.Name))
                errors.AppendLine("Укажите имя клиента");
            if (string.IsNullOrWhiteSpace(_currentClient.Surname))
                errors.AppendLine("Укажите фамилию клиента");
            if (_currentClient.ID == 0)
                ToyStoreEntities.GetContext().Client.Add(_currentClient);
            try
            {
                ToyStoreEntities.GetContext().SaveChanges();
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

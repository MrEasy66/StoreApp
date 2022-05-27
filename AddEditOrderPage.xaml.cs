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
    /// Логика взаимодействия для AddEditOrderPage.xaml
    /// </summary>
    public partial class AddEditOrderPage : Page
    {
        private Order _currentOrder = new Order();
        public AddEditOrderPage(Order selectedOrder)
        {
            InitializeComponent();
            if (selectedOrder != null)
                _currentOrder = selectedOrder;
            DataContext = _currentOrder;
            comboBoxClientId.ItemsSource = ToyStoreEntities.GetContext().Client.ToList();
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentOrder.Manufacturer))
                errors.AppendLine("Укажите производителя");
            if (string.IsNullOrWhiteSpace(_currentOrder.Product))
                errors.AppendLine("Укажите товар");
            if (_currentOrder.ID == 0)
                ToyStoreEntities.GetContext().Order.Add(_currentOrder);
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

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
            comboBoxClientId.ItemsSource = ToyStoreDBEntities.GetContext().Client.ToList();
            comboBoxProductId.ItemsSource = ToyStoreDBEntities.GetContext().Product.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentOrder.ProductCount.ToString()))
                errors.AppendLine("Укажите количество товара");
            if (string.IsNullOrWhiteSpace(_currentOrder.OrderPrice.ToString()))
                errors.AppendLine("Укажите стоимость товара");
            if (_currentOrder.ID == 0)
                ToyStoreDBEntities.GetContext().Order.Add(_currentOrder);
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

        private void txtBoxOrderPrice_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (int.TryParse(e.Text, out int i))
            {
                e.Handled = true;
            }

            if (e.Text==e.Text.ToLower())
            {
                e.Handled = true;
            }
        }

        private void txtBoxProductCount_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            if (int.TryParse(e.Text, out int i))
            {
                e.Handled = true;
            }

            if (e.Text == e.Text.ToLower())
            {
                e.Handled = true;
            }
        }
    }
}

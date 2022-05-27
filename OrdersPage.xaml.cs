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
    /// Логика взаимодействия для OrdersPage.xaml
    /// </summary>
    public partial class OrdersPage : Page
    {
        public OrdersPage()
        {
            InitializeComponent();
            OrdersGrid.ItemsSource = ToyStoreEntities.GetContext().Order.ToList();
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOrderPage(null));
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var ordersForRemoving = OrdersGrid.SelectedItems.Cast<Order>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {ordersForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreEntities.GetContext().Order.RemoveRange(ordersForRemoving);
                    ToyStoreEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    OrdersGrid.ItemsSource = ToyStoreEntities.GetContext().Order.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOrderPage((sender as Button).DataContext as Order));
        }
    }
}

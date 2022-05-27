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
using ToysStoreApp.Pages

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
            ordersGrid.ItemsSource = ToyStoreDBEntities.GetContext().Order.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Клиент");
            filterBox.Items.Add("Товар");
            filterBox.Items.Add("Количество товара");
            filterBox.Items.Add("Стоимость заказа");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOrderPage(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var ordersForRemoving = ordersGrid.SelectedItems.Cast<Order>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {ordersForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreDBEntities.GetContext().Order.RemoveRange(ordersForRemoving);
                    ToyStoreDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    ordersGrid.ItemsSource = ToyStoreDBEntities.GetContext().Order.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOrderPage((sender as Button).DataContext as Order));
        }

        private void Update()
        {
            List<Order> currentOrder = ToyStoreDBEntities.GetContext().Order.ToList();
            
            if (filterBox.SelectedIndex == 0)
                ordersGrid.ItemsSource = currentOrder.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                ordersGrid.ItemsSource = currentOrder.OrderBy(p => p.ClientId);
            if (filterBox.SelectedIndex == 2)
                ordersGrid.ItemsSource = currentOrder.OrderBy(p => p.ProductId);
            if (filterBox.SelectedIndex == 3)
                ordersGrid.ItemsSource = currentOrder.OrderBy(p => p.ProductCount);
            if (filterBox.SelectedIndex == 4)
                ordersGrid.ItemsSource = currentOrder.OrderBy(p => p.OrderPrice);
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
        private void btnPrint_Click(object sender, RoutedEventArgs e)
        {
            System.Windows.Controls.PrintDialog printDialog = new System.Windows.Controls.PrintDialog();
            if((bool)printDialog.ShowDialog().GetValueOrDefault())
            {
                Size pageSize = new Size(printDialog.PrintableAreaWidth, printDialog.PrintableAreaHeight);
                ordersGrid.Measure(pageSize);
                ordersGrid.Arrange(new Rect(5, 5, pageSize.Width, pageSize.Height));
                printDialog.PrintVisual(ordersGrid, Title);
            }
        }

        private void btnOrderRequest_Click(object sender, RoutedEventArgs e)
        {
            OrderRequestWindow orderRequestWindow = new OrderRequestWindow();
        }
    }
}

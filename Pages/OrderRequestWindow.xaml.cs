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
using System.Windows.Shapes;
using ToysStoreApp.Data;

namespace ToysStoreApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для OrderRequestWindow.xaml
    /// </summary>
    public partial class OrderRequestWindow : Window
    {
        public OrderRequestWindow()
        {
            InitializeComponent();
            requestsGrid.ItemsSource = ToyStoreDBEntities.GetContext().OrderRequest.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Товар");
            filterBox.Items.Add("Количество товара");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void Update()
        {
            List<OrderRequest> currentOrderRequest = ToyStoreDBEntities.GetContext().OrderRequest.ToList();

            if (filterBox.SelectedIndex == 0)
                requestsGrid.ItemsSource = currentOrderRequest.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                requestsGrid.ItemsSource = currentOrderRequest.OrderBy(p => p.Product);
            if (filterBox.SelectedIndex == 2)
                requestsGrid.ItemsSource = currentOrderRequest.OrderBy(p => p.ProductCount);
        }
    }
}

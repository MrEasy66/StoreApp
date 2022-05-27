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
    /// Логика взаимодействия для ProductPage.xaml
    /// </summary>
    public partial class ProductPage : Page
    {
        public ProductPage()
        {
            InitializeComponent();
            productsGrid.ItemsSource = ToyStoreDBEntities.GetContext().Product.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Название");
            filterBox.Items.Add("Производитель");
            filterBox.Items.Add("Цена");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditProductPage((sender as Button).DataContext as Product));
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditProductPage(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var productsForRemoving = productsGrid.SelectedItems.Cast<Order>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {productsForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreDBEntities.GetContext().Order.RemoveRange(productsForRemoving);
                    ToyStoreDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    productsGrid.ItemsSource = ToyStoreDBEntities.GetContext().Order.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Update()
        {
            List<Product> currentProduct = ToyStoreDBEntities.GetContext().Product.ToList();
            currentProduct = currentProduct.Where(p => p.Name.ToLower().Contains(searchBox.Text.ToLower()) || 
            p.Manufacturer.ToLower().Contains(searchBox.Text.ToLower())).ToList();

            if (filterBox.SelectedIndex == 0)
                productsGrid.ItemsSource = currentProduct.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                productsGrid.ItemsSource = currentProduct.OrderBy(p => p.Name);
            if (filterBox.SelectedIndex == 2)
                productsGrid.ItemsSource = currentProduct.OrderBy(p => p.Manufacturer);
            if (filterBox.SelectedIndex == 3)
                productsGrid.ItemsSource = currentProduct.OrderBy(p => p.Cost);
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }
    }
}

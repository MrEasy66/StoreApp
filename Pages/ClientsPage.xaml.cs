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
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {
        public ClientsPage()
        {
            InitializeComponent();
            clientsGrid.ItemsSource = ToyStoreDBEntities.GetContext().Client.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Имя");
            filterBox.Items.Add("Фамилия");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void Update()
        {
            List<Client> currentClient = ToyStoreDBEntities.GetContext().Client.ToList();
            currentClient = currentClient.Where(p => p.Name.ToLower().Contains(searchBox.Text.ToLower()) || p.Surname.ToLower().Contains(searchBox.Text.ToLower())).ToList();

            if (filterBox.SelectedIndex == 0)
                clientsGrid.ItemsSource = currentClient.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                clientsGrid.ItemsSource = currentClient.OrderBy(p => p.Name);
            if (filterBox.SelectedIndex == 2)
                clientsGrid.ItemsSource = currentClient.OrderBy(p => p.Surname);

        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditClientPage(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var clientsForRemoving = clientsGrid.SelectedItems.Cast<Client>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {clientsForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreDBEntities.GetContext().Client.RemoveRange(clientsForRemoving);
                    ToyStoreDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    clientsGrid.ItemsSource = ToyStoreDBEntities.GetContext().Client.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditClientPage((sender as Button).DataContext as Client));
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
    }
}

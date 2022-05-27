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
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class ClientsPage : Page
    {
        public ClientsPage()
        {
            InitializeComponent();
            ClientsGrid.ItemsSource = ToyStoreEntities.GetContext().Client.ToList();
        }

        private void SearchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        public void Update()
        {
            ClientsGrid.ItemsSource = ToyStoreEntities.GetContext().Client.Where(p => p.Name.ToLower().Contains(SearchBox.Text.ToLower()) || p.Surname.ToLower().Contains(SearchBox.Text.ToLower())).ToList();
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditClientPage(null));
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var clientsForRemoving = ClientsGrid.SelectedItems.Cast<Client>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {clientsForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreEntities.GetContext().Client.RemoveRange(clientsForRemoving);
                    ToyStoreEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    ClientsGrid.ItemsSource = ToyStoreEntities.GetContext().Client.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditClientPage((sender as Button).DataContext as Client));
        }
    }
}

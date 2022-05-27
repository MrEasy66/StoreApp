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
    /// Логика взаимодействия для OffersPage.xaml
    /// </summary>
    public partial class OffersPage : Page
    {
        public OffersPage()
        {
            InitializeComponent();
            offersGrid.ItemsSource = ToyStoreDBEntities.GetContext().PersonalOffer.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Предложение");
            filterBox.Items.Add("ID Клиента");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOfferPage((sender as Button).DataContext as PersonalOffer));
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOfferPage(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var offersForRemoving = offersGrid.SelectedItems.Cast<PersonalOffer>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {offersForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreDBEntities.GetContext().PersonalOffer.RemoveRange(offersForRemoving);
                    ToyStoreDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    offersGrid.ItemsSource = ToyStoreDBEntities.GetContext().PersonalOffer.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void Update()
        {
            List<PersonalOffer> currentOffer = ToyStoreDBEntities.GetContext().PersonalOffer.ToList();
            currentOffer = currentOffer.Where(p => p.Name.ToLower().Contains(searchBox.Text.ToLower())).ToList();

            if (filterBox.SelectedIndex == 0)
                offersGrid.ItemsSource = currentOffer.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                offersGrid.ItemsSource = currentOffer.OrderBy(p => p.Name);
            if (filterBox.SelectedIndex == 2)
                offersGrid.ItemsSource = currentOffer.OrderBy(p => p.ClientId);
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }
    }
}

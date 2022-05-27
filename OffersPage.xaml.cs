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
    /// Логика взаимодействия для OffersPage.xaml
    /// </summary>
    public partial class OffersPage : Page
    {
        public OffersPage()
        {
            InitializeComponent();
            OffersGrid.ItemsSource = ToyStoreEntities.GetContext().PersonalOffer.ToList();
        }

        private void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOfferPage((sender as Button).DataContext as PersonalOffer));
        }

        private void ButtonAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditOfferPage(null));
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            var offersForRemoving = OffersGrid.SelectedItems.Cast<PersonalOffer>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {offersForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreEntities.GetContext().PersonalOffer.RemoveRange(offersForRemoving);
                    ToyStoreEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    OffersGrid.ItemsSource = ToyStoreEntities.GetContext().PersonalOffer.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }
    }
}

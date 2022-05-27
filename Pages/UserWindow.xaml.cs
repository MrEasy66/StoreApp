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
using ToysStoreApp.Pages;

namespace ToysStoreApp
{
    /// <summary>
    /// Логика взаимодействия для UserWindow.xaml
    /// </summary>
    public partial class UserWindow : Window
    {
        public UserWindow(User user)
        {
            InitializeComponent();
            Manager.MainFrame = mainFrame;
            mainFrame.Navigate(new UserPage(user));
            if(user.TypeOfUser.Name == "Administrator")
            {
                btnOrders.Visibility = Visibility.Hidden;
                btnProduct.Visibility = Visibility.Hidden;
                btnClients.Visibility = Visibility.Hidden;
                btnOffer.Visibility = Visibility.Hidden;
            }
            if(user.TypeOfUser.Name == "Manager")
            {
                btnHistory.Visibility = Visibility.Hidden;
                btnUsers.Visibility = Visibility.Hidden;
            }
        }

        private void mainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (mainFrame.CanGoBack)
            {
                btnBack.Visibility = Visibility.Visible;
            }
            else
            {
                btnBack.Visibility = Visibility.Hidden;
            }
        }

        private void btnBack_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.GoBack();
        }

        private void btnHistory_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new HistoryPage());
        }

        private void btnClients_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new ClientsPage());
        }

        private void btnOffer_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new OffersPage());
        }

        private void btnOrders_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new OrdersPage());
        }

        private void btnProduct_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new ProductPage());
        }

        private void btnExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void btnUsers_Click(object sender, RoutedEventArgs e)
        {
            mainFrame.Navigate(new UsersPage());
        }
    }
}

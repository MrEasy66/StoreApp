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
            Manager.MainFrame = MainFrame;
            MainFrame.Navigate(new UserPage(user));
            if(user.TypeOfUser.Name == "Admin")
            {
                ButtonOrders.Visibility = Visibility.Hidden;
            }
            if(user.TypeOfUser.Name == "Manager")
            {
                ButtonHistory.Visibility = Visibility.Hidden;
            }
            if(user.TypeOfUser.Name == "Client")
            {
                ButtonClients.Visibility = Visibility.Hidden;
                ButtonHistory.Visibility = Visibility.Hidden;
                ButtonOffer.Visibility = Visibility.Hidden;
            }
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {
            if (MainFrame.CanGoBack)
            {
                ButtonBack.Visibility = Visibility.Visible;
            }
            else
            {
                ButtonBack.Visibility = Visibility.Hidden;
            }
        }

        private void ButtonBack_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.GoBack();
        }

        private void ButtonExit_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void ButtonHistory_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new HistoryPage());
        }

        private void ButtonClients_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new ClientsPage());
        }

        private void ButtonOffer_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OffersPage());
        }

        private void ButtonOrders_Click(object sender, RoutedEventArgs e)
        {
            MainFrame.Navigate(new OrdersPage());
        }
    }
}

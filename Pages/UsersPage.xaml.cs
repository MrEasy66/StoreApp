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
    /// Логика взаимодействия для UsersPage.xaml
    /// </summary>
    public partial class UsersPage : Page
    {
        public UsersPage()
        {
            InitializeComponent();
            usersGrid.ItemsSource = ToyStoreDBEntities.GetContext().User.ToList();
            filterBox.Items.Add("Все");
            filterBox.Items.Add("Логин");
            filterBox.Items.Add("Пароль");
            filterBox.SelectedIndex = 0;
            Update();
        }

        private void Update()
        {
            List<User> currentUser = ToyStoreDBEntities.GetContext().User.ToList();
            currentUser = currentUser.Where(p => p.Password.ToLower().Contains(searchBox.Text.ToLower()) || p.Login.ToLower().Contains(searchBox.Text.ToLower())).ToList();

            if (filterBox.SelectedIndex == 0)
                usersGrid.ItemsSource = currentUser.OrderBy(p => p.ID).ToList();
            if (filterBox.SelectedIndex == 1)
                usersGrid.ItemsSource = currentUser.OrderBy(p => p.Login);
            if (filterBox.SelectedIndex == 2)
                usersGrid.ItemsSource = currentUser.OrderBy(p => p.Password);
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            Update();
        }

        private void filterBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            Update();
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditUserPage(null));
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var usersForRemoving = usersGrid.SelectedItems.Cast<User>().ToList();
            if (MessageBox.Show($"Вы точно хотите удалить следующие {usersForRemoving.Count()} элементов?", "", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    ToyStoreDBEntities.GetContext().User.RemoveRange(usersForRemoving);
                    ToyStoreDBEntities.GetContext().SaveChanges();
                    MessageBox.Show("Данные удалены!");
                    usersGrid.ItemsSource = ToyStoreDBEntities.GetContext().User.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditUserPage((sender as Button).DataContext as User));
        }
    }
}

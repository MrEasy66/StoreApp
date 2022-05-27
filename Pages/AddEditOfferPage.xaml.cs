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
    /// Логика взаимодействия для AddEditOfferPage.xaml
    /// </summary>
    public partial class AddEditOfferPage : Page
    {
        private PersonalOffer _currentOffer = new PersonalOffer();
        public AddEditOfferPage(PersonalOffer selectedOffer)
        {
            InitializeComponent();
            if (selectedOffer != null)
                _currentOffer = selectedOffer;
            DataContext = _currentOffer;
            comboBoxClientId.ItemsSource = ToyStoreDBEntities.GetContext().Client.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrWhiteSpace(_currentOffer.Name))
                errors.AppendLine("Укажите название предложения");
            if (_currentOffer.ID == 0)
                ToyStoreDBEntities.GetContext().PersonalOffer.Add(_currentOffer);
            try
            {
                ToyStoreDBEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена");
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}

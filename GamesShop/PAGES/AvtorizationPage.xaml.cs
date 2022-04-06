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

namespace GamesShop.PAGES
{
    /// <summary>
    /// Логика взаимодействия для AvtorizationPage.xaml
    /// </summary>
    public partial class AvtorizationPage : Page
    {
        public AvtorizationPage()
        {
            InitializeComponent();
        }

        private void Registationbtn_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new RegisterPage());
        }

        private void Entrancebtn_Click(object sender, RoutedEventArgs e)
        {
            ShopGamesContext db = new ShopGamesContext();
            string username = Logintb1.Text;
            string password = Passwordbx.Password;

            var user = db.Users.Where(x => x.Login == username).FirstOrDefault();
            if(password == user.Password)
            {
                Polzovatel.mainuser = user;
                if (Polzovatel.mainuser.Adminisrator == 1)
                {
                    AdminWindow adminwin = new AdminWindow();
                    adminwin.Show();
                    Application.Current.Windows[0].Close();
                }
                while (NavigationService.CanGoBack)
                {
                    NavigationService.GoBack();
                }
            
            }
            else
            {
                MessageBox.Show("Неверный пароль");
            }


        }
    }
}

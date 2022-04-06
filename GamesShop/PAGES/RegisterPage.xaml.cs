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
    /// Interaction logic for RegisterPage.xaml
    /// </summary>
    public partial class RegisterPage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        public RegisterPage()
        {
            InitializeComponent();
        }
 
        

        private void Registationbtn_Click(object sender, RoutedEventArgs e)
        {
            string login = Logintb1.Text;
            string pass1 = Passwordbx.Password;
            string pass2 = Passwordbx2.Password;

            if (db.Users.Any(x => x.Login == login))
            {
                MessageBox.Show("Этот логин уже занят!");
            }
            else
            {
                if (pass1 == pass2)
                {
                    db.Users.Add(new User
                    {
                        Login = login,
                        Password = pass1
                    });
                    db.SaveChanges();
                    MessageBox.Show("Регистрация прошла успешно!");
                    NavigationService.GoBack();
                }
            }
            
        }
    }
}

using GamesShop.PAGES;
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

namespace GamesShop
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            MainFrame.Navigate(new MainPage(SearchBox.Text));
            
        }


        private void Avtorizationbtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            // Кнопка регистрации
            if(Polzovatel.mainuser == null)
            {
                MainFrame.Navigate(new AvtorizationPage());
            }
            else
            {
                var result = MessageBox.Show("Вы хотите выйти из своей учетной записи?", "Выход", MessageBoxButton.YesNo, MessageBoxImage.Question);
                if(result == MessageBoxResult.Yes)
                {
                    Polzovatel.mainuser = null;
                    while (MainFrame.CanGoBack)
                    {
                        MainFrame.GoBack();
                        SearchBox.Text = "";
                    }
                }
            }
        }

        private void Wishlist_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new WishPage());
        }

        private void Cart_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new CartPage());
        }

        private void Homebtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            while (MainFrame.CanGoBack)
            {
                MainFrame.GoBack();
                SearchBox.Text = "";
            }

        }

        private void BackBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            // Кнопка назад
            if (MainFrame.CanGoBack)
            {
                MainFrame.GoBack();
                SearchBox.Text = "";
            }
        }

        private void SearchBox_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            MainFrame.Navigate(new MainPage(SearchBox.Text));
        }

        private void Check_MouseDown(object sender, MouseButtonEventArgs e)
        {
            MainFrame.Navigate(new CheckPage());
        }

        private void Close_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }
    }
}

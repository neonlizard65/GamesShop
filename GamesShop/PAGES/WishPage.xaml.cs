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
    /// Interaction logic for WishPage.xaml
    /// </summary>
    public partial class WishPage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        List<Game> games = new List<Game>();
        public WishPage()
        {
            InitializeComponent();
            WishBox.Visibility = Visibility.Collapsed;
            EmptyWishText.Visibility = Visibility.Collapsed;
            if (Polzovatel.mainuser != null)
            {
                LoginCheckText.Visibility = Visibility.Collapsed;


                Polzovatel.GetWishGames(db);
                games = Polzovatel.wishgames;

                WishBox.ItemsSource = games;
                WishBox.Visibility = Visibility.Visible;

                if (games.Count == 0)
                {
                    EmptyWishText.Visibility = Visibility.Visible;
                    WishBox.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void ToCartBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            Polzovatel.GetCartGames(db);
            var cartgames = Polzovatel.cartgames;
            

            if (cartgames.Where(x=>x.IDGames == ((sender as Image).DataContext as Game).IDGames).ToList().Count > 0)
            {
                MessageBox.Show("Игра уже в корзине");
            }
            else
            {
                db.Carts.Add(new Cart()
                {
                    idgame = ((sender as Image).DataContext as Game).IDGames,
                    iduser = Polzovatel.mainuser.IDUser
                });

                db.SaveChanges();
                MessageBox.Show("Игра добавлена в корзину");
            }
         
        }

        private void ScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            ScrollViewer scv = (ScrollViewer)sender;
            scv.ScrollToVerticalOffset(scv.VerticalOffset - e.Delta);
            e.Handled = true;
        }

        private void RemoveFromWishBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var gameim = (sender as Image).DataContext as Game;
            var gamewish = db.Wishlists.Where(x => x.iduser == Polzovatel.mainuser.IDUser && x.idgame == gameim.IDGames).FirstOrDefault();
            db.Wishlists.Remove(gamewish);
            db.SaveChanges();

            Polzovatel.GetWishGames(db);
            var games = Polzovatel.wishgames;

            WishBox.ItemsSource = games;
            WishBox.Visibility = Visibility.Visible;

            if (games.Count == 0)
            {
                EmptyWishText.Visibility = Visibility.Visible;
                WishBox.Visibility = Visibility.Collapsed;
            }
        }
    }
}

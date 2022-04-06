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
using System.Windows.Threading;

namespace GamesShop.PAGES
{
    /// <summary>
    /// Interaction logic for CartPage.xaml
    /// </summary>
    public partial class CartPage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        public CartPage()
        {

            InitializeComponent();

            SumTxt.Visibility = Visibility.Collapsed;
            BuyBtn.Visibility = Visibility.Collapsed;
            CartBox.Visibility = Visibility.Collapsed;
            EmptyCartText.Visibility = Visibility.Collapsed;
            if (Polzovatel.mainuser != null)
            {
                LoginCheckText.Visibility = Visibility.Collapsed;

                Polzovatel.GetCartGames(db);

                var games = Polzovatel.cartgames;
 
                CartBox.ItemsSource = games;
                SumTxt.Text = String.Format("Сумма: {0:F2} ₽", (games.Sum(x => x.Price)));
                CartBox.Visibility = Visibility.Visible;
                SumTxt.Visibility = Visibility.Visible;
                BuyBtn.Visibility = Visibility.Visible;

                if (games.Count == 0)
                {
                    EmptyCartText.Visibility = Visibility.Visible;
                    BuyBtn.Visibility = Visibility.Collapsed;
                    CartBox.Visibility = Visibility.Collapsed;
                    SumTxt.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void ScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            ScrollViewer scv = (ScrollViewer)sender;
            scv.ScrollToVerticalOffset(scv.VerticalOffset - e.Delta);
            e.Handled = true;
        }

        private void BuyBtn_Click(object sender, RoutedEventArgs e)
        {
            foreach(var game in Polzovatel.cartgames)
            {
                string symbols = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
                StringBuilder sb = new StringBuilder();
                Random rnd = new Random();

                for (int i = 0; i < 20; i++)
                {
                    sb.Append(symbols[rnd.Next(0, symbols.Length)].ToString());
                }
                var key = db.Keys.Add(new Key() {  cdKey = sb.ToString()});
                db.Payments.Add(new Payment() { iduser = Polzovatel.mainuser.IDUser, idgame = game.IDGames, idkey = key.IDKey, DataBuying = DateTime.Now, Price = game.Price });
                db.Carts.Remove(db.Carts.Where(x => x.iduser == Polzovatel.mainuser.IDUser && x.idgame == game.IDGames).FirstOrDefault());
                db.SaveChanges();
                sb.Clear();
            }

            Polzovatel.GetCartGames(db);
            var games = Polzovatel.cartgames;
            CartBox.ItemsSource = games;
            SumTxt.Text = String.Format("Сумма: {0:F2} ₽", (games.Sum(x => x.Price)));
            CartBox.Visibility = Visibility.Visible;
            SumTxt.Visibility = Visibility.Visible;
            BuyBtn.Visibility = Visibility.Visible;

            if (games.Count == 0)
            {
                EmptyCartText.Visibility = Visibility.Visible;
                BuyBtn.Visibility = Visibility.Collapsed;
                CartBox.Visibility = Visibility.Collapsed;
                SumTxt.Visibility = Visibility.Collapsed;
            }
            MessageBox.Show("Покупка совершена! Ключи можно увидеть на странице чеков! Также, вы можете оставить один комментарий на странице игры");

        }

    
        private void RemoveBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            var gameim = (sender as Image).DataContext as Game;
            var gameincart= db.Carts.Where(x => x.iduser == Polzovatel.mainuser.IDUser && x.idgame == gameim.IDGames).FirstOrDefault();
            db.Carts.Remove(gameincart);
            db.SaveChanges();


            Polzovatel.GetCartGames(db);
            var games = Polzovatel.cartgames;


            CartBox.ItemsSource = games;
            SumTxt.Text = String.Format("Сумма: {0:F2} ₽", (games.Sum(x => x.Price)));
            CartBox.Visibility = Visibility.Visible;
            SumTxt.Visibility = Visibility.Visible;
            BuyBtn.Visibility = Visibility.Visible;

            if (games.Count == 0)
            {
                EmptyCartText.Visibility = Visibility.Visible;
                BuyBtn.Visibility = Visibility.Collapsed;
                CartBox.Visibility = Visibility.Collapsed;
                SumTxt.Visibility = Visibility.Collapsed;
            }
        }
    }
}

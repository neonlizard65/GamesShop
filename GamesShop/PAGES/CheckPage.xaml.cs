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
    /// Interaction logic for CheckPage.xaml
    /// </summary>
    public partial class CheckPage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        public CheckPage()
        {
            InitializeComponent();

            HistoryBox.Visibility = Visibility.Collapsed;
            EmptyText.Visibility = Visibility.Collapsed;
            if (Polzovatel.mainuser != null)
            {
                LoginCheckText.Visibility = Visibility.Collapsed;

                var boughtgames = (from game in db.Games
                               join payment in db.Payments on game.IDGames equals payment.idgame
                               join user in db.Users on payment.iduser equals user.IDUser
                               where user.IDUser == Polzovatel.mainuser.IDUser
                               select new
                               {
                                   game = game,
                                   payement = payment
                               }).ToList();

                HistoryBox.ItemsSource = boughtgames;
                HistoryBox.Visibility = Visibility.Visible;


                if (boughtgames.Count == 0)
                {
                    EmptyText.Visibility = Visibility.Visible;
                    HistoryBox.Visibility = Visibility.Collapsed;
                }
            }
        }

        private void ScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            ScrollViewer scv = (ScrollViewer)sender;
            scv.ScrollToVerticalOffset(scv.VerticalOffset - e.Delta);
            e.Handled = true;
        }
    }
}

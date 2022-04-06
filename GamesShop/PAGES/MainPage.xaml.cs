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
    /// Логика взаимодействия для MainPage.xaml
    /// </summary>
    public partial class MainPage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        public MainPage(string search)
        {
            InitializeComponent();
            if (search != "")
                GameBox.ItemsSource = db.Games.Where(x => x.Nazvanie.ToLower().Contains(search.ToLower()) ||
                                                        x.Developer.NazvaniaDeveloper.ToLower().Contains(search.ToLower()) ||
                                                        x.Publisher.NazvaniePublisher.ToLower().Contains(search.ToLower()) ||
                                                        x.GenreGames.Any(a => a.Genre.NazvaniaGenre.ToLower().Contains(search.ToLower()))).OrderBy(x => x.Nazvanie).ToList();
            else
                GameBox.ItemsSource = db.Games.OrderBy(x => x.Nazvanie).ToList();

        }

        private void ScrollViewer_PreviewMouseWheel(object sender, MouseWheelEventArgs e)
        {
            ScrollViewer scv = (ScrollViewer)sender;
            scv.ScrollToVerticalOffset(scv.VerticalOffset - e.Delta);
            e.Handled = true;
        }

        private void GameBox_PreviewMouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            if (((sender as ListView).SelectedItem as Game) != null)
            {
                NavigationService.Navigate(new GamePage((sender as ListView).SelectedItem as Game));
            }
            
        }
    }
}

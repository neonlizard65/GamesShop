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
    /// Interaction logic for GamePage.xaml
    /// </summary>
    public partial class GamePage : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        Game game;
        public GamePage(Game game)
        {
            InitializeComponent();
            try
            {
                this.game = game;
                DataContext = game;

                StringBuilder sb = new StringBuilder();

                foreach (var genre in db.GenreGames.Where(x => x.idgame == game.IDGames))
                {
                    sb.Append(genre.Genre.NazvaniaGenre + ", ");
                }
                if (sb.Length > 2)
                {
                    sb.Remove(sb.Length - 2, 2);
                }
                GenresText.Text = sb.ToString();

                CommentBox.ItemsSource = db.Comments.Where(x => x.idgame == game.IDGames).ToList();

                if(Polzovatel.mainuser == null)
                {
                    CommentText.Visibility = Visibility.Collapsed;
                    PublishBtn.Visibility = Visibility.Collapsed;
                }
                else
                {
                    if (db.Comments.Where(x => x.idgame == game.IDGames && x.iduser == Polzovatel.mainuser.IDUser).ToList().Count == 0 &&
                        db.Payments.Where(x => x.idgame == game.IDGames && x.iduser == Polzovatel.mainuser.IDUser).ToList().Count > 0)
                    {
                       
                        CommentText.Visibility = Visibility.Visible;
                        PublishBtn.Visibility = Visibility.Visible;
                    }
                    else
                    {
                        
                        CommentText.Visibility = Visibility.Collapsed;
                        PublishBtn.Visibility = Visibility.Collapsed;
                    }
                        
                }

                
            }
            catch
            {

            }
        }

        private void ToCartBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if(Polzovatel.mainuser != null)
            {
                Polzovatel.GetCartGames(db);
                if (Polzovatel.cartgames.Where(x => x.IDGames == (DataContext as Game).IDGames).ToList().Count > 0)
                {
                    MessageBox.Show("Игра уже в корзине");
                }
                else
                {
                    db.Carts.Add(new Cart()
                    {
                        idgame = (DataContext as Game).IDGames,
                        iduser = Polzovatel.mainuser.IDUser
                    });

                    db.SaveChanges();
                    MessageBox.Show("Игра добавлена в корзину");
                }
            }
            else
            {
                MessageBox.Show("Для того чтобы добавить игру в корзину, надо войти в учетную запись.");

            }
        }

        private void ToWishlist_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (Polzovatel.mainuser != null)
            {
                Polzovatel.GetWishGames(db);
                if (Polzovatel.wishgames.Where(x => x.IDGames == (DataContext as Game).IDGames).ToList().Count > 0)
                {
                    MessageBox.Show("Игра уже в списке желаемых игр");
                }
                else
                {
                    db.Wishlists.Add(new Wishlist()
                    {
                        idgame = (DataContext as Game).IDGames,
                        iduser = Polzovatel.mainuser.IDUser
                    });

                    db.SaveChanges();
                    MessageBox.Show("Игра добавлена в список желаемых игр");
                }
            }
            else
            {
                MessageBox.Show("Для того чтобы добавить игру в список желаемых игр, надо войти в учетную запись.");

            }
        }

        private void PublishBtn_Click(object sender, RoutedEventArgs e)
        {
            if (!String.IsNullOrWhiteSpace(CommentText.Text))
            {
                db.Comments.Add(new Comment() { idgame = this.game.IDGames, iduser = Polzovatel.mainuser.IDUser, Rating = CommentText.Text });
                db.SaveChanges();
                CommentBox.ItemsSource = db.Comments.Where(x => x.idgame == game.IDGames).ToList();

                CommentText.Visibility = Visibility.Collapsed;
                PublishBtn.Visibility = Visibility.Collapsed;
            }
            else
            {
                MessageBox.Show("Сообщение не может быть пустым!");
            }

        }
    }
}

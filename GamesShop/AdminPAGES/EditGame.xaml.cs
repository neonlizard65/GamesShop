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

namespace GamesShop.AdminPAGES
{
    /// <summary>
    /// Interaction logic for EditGame.xaml
    /// </summary>
    /// 
    
    public partial class EditGame : Page
    {
        ShopGamesContext db = new ShopGamesContext();

        public EditGame()
        {
            InitializeComponent();
            DataPanel.Visibility = Visibility.Hidden;
            SelectedGame.ItemsSource = db.Games.OrderBy(x=>x.Nazvanie).ToList();
           
        }

        private void BackBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            NavigationService.GoBack();
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!String.IsNullOrWhiteSpace(NazvanieBox.Text) && !String.IsNullOrWhiteSpace(DevBox.Text) &&
              !String.IsNullOrWhiteSpace(PubBox.Text) && !String.IsNullOrWhiteSpace(PubDate.Text) &&
              !String.IsNullOrWhiteSpace(DescBox.Text) && !String.IsNullOrWhiteSpace(PriceBox.Text) &&
              !String.IsNullOrWhiteSpace(GenreBox.Text) && !String.IsNullOrWhiteSpace(OSBox.Text) &&
              !String.IsNullOrWhiteSpace(CPUBox.Text) && !String.IsNullOrWhiteSpace(RamBox.Text) &&
              !String.IsNullOrWhiteSpace(GpuBox.Text) && !String.IsNullOrWhiteSpace(StorageBox.Text) &&
              !String.IsNullOrWhiteSpace(PhotoBox.Text))
                {
                    Developer dev = null;
                    Publisher pub = null;
                    if (db.Publishers.Where(x => x.NazvaniePublisher.ToLower() == PubBox.Text.ToLower()).Count() > 0)
                    {
                        pub = db.Publishers.Where(x => x.NazvaniePublisher.ToLower() == PubBox.Text.ToLower()).FirstOrDefault();
                    }
                    else
                    {
                        pub = db.Publishers.Add(new Publisher() { NazvaniePublisher = PubBox.Text });
                        db.SaveChanges();
                    }

                    if (db.Developers.Where(x => x.NazvaniaDeveloper.ToLower() == DevBox.Text.ToLower()).Count() > 0)
                    {
                        dev = db.Developers.Where(x => x.NazvaniaDeveloper.ToLower() == DevBox.Text.ToLower()).FirstOrDefault();
                    }
                    else
                    {
                        dev = db.Developers.Add(new Developer() { NazvaniaDeveloper = DevBox.Text });
                        db.SaveChanges();
                    }


                    SystemRequirement sr = db.SystemRequirements.Where(x => x.OS == OSBox.Text && x.CPU == CPUBox.Text && x.RAM == RamBox.Text && x.GPU == GpuBox.Text && x.Storage == StorageBox.Text).FirstOrDefault();
                    if (sr == null)
                    {
                        sr = new SystemRequirement()
                        {
                            OS = OSBox.Text,
                            CPU = CPUBox.Text,
                            RAM = RamBox.Text,
                            GPU = GpuBox.Text,
                            Storage = StorageBox.Text,
                        };
                        sr = db.SystemRequirements.Add(sr);
                        db.SaveChanges();
                    }

                 
                    Game game = new Game()
                    {
                        Nazvanie = NazvanieBox.Text,
                        idDeveloper = dev.IDDeveloper,
                        idPublisher = pub.IDPublisher,
                        Pablicationdate = Convert.ToDateTime(PubDate.Text),
                        Description = DescBox.Text,
                        Price = Convert.ToDecimal(PriceBox.Text),
                        idSystemrequirements = sr.IDSystemRequirements,
                        Picture = PhotoBox.Text
                    };
                    var sqlgame = db.Games.Where(x => x.Nazvanie == game.Nazvanie).FirstOrDefault();
                    game.IDGames = sqlgame.IDGames;
                    sqlgame = game;
                    sqlgame.idSystemrequirements = sr.IDSystemRequirements;
                    sqlgame.SystemRequirement = sr;
                    db.SaveChanges();

                    List<Genre> genrelist = db.GenreGames.Where(x => x.idgame == game.IDGames).Select(x => x.Genre).ToList();
                    List<Genre> newgenrelist = new List<Genre>();
                    string[] genres = GenreBox.Text.Split(',');
                    foreach (string genrestr in genres)
                    {
                        var genre = db.Genres.Where(x => x.NazvaniaGenre.ToLower() == genrestr.Trim().ToLower()).FirstOrDefault();
                        if (genre != null)
                        {
                            if (db.GenreGames.Where( x => x.idgame == game.IDGames && x.idgenre == genre.IDGenre ).Count() == 0)
                                db.GenreGames.Add(new GenreGame() { idgame = game.IDGames, idgenre = genre.IDGenre });
                            db.SaveChanges();
                            newgenrelist.Add(genre);
                        }
                        else
                        {
                            genre = db.Genres.Add(new Genre() { NazvaniaGenre = genrestr });
                            db.SaveChanges();
                            db.GenreGames.Add(new GenreGame() { idgame = game.IDGames, idgenre = genre.IDGenre });
                            db.SaveChanges();
                        }
                    }

                    foreach (var genre in genrelist)
                    {
                        if (!newgenrelist.Contains(genre))
                        {
                            db.GenreGames.Remove(new GenreGame() { idgenre = genre.IDGenre, idgame = game.IDGames });
                        }
                    }
                    db.SaveChanges();
                    MessageBox.Show("Игра обновлена!");
                }
                else
                {
                    MessageBox.Show("Заполните все поля!");
                }
         
            }
            catch (Exception ex){ MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error); }
           
        }
    

        private void DeleteBtn_Click(object sender, RoutedEventArgs e)
        {
            DataContext = SelectedGame.SelectedItem as Game;
            var game = SelectedGame.SelectedItem as Game;

            db.Games.Remove(game);
            db.SaveChanges();
            NavigationService.GoBack();
        }

        private void SelectedGame_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            DataPanel.Visibility = Visibility.Visible;
            try
            {
                DataContext = SelectedGame.SelectedItem as Game;
                var game = SelectedGame.SelectedItem as Game;
                if (game.GenreGames.Count != 0)
                {
                    StringBuilder genrestext = new StringBuilder();
                    var genres = db.GenreGames.Where(x => x.idgame == game.IDGames).ToList();
                    foreach (var genre in genres)
                    {
                        genrestext.Append(db.Genres.Where(x => x.IDGenre == genre.idgenre).FirstOrDefault().NazvaniaGenre.ToString() + ", ");
                    }
                    if (genrestext.Length > 2)
                    {

                        genrestext.Remove(genrestext.Length - 2, 2);
                    }
                    else
                    {
                        GenreBox.Text = "";
                    }

                    GenreBox.Text = genrestext.ToString();
                }
            }
            catch
            {
                GenreBox.Text = "";
            }

        }
    }
}

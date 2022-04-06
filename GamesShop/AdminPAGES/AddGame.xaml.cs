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
    /// Interaction logic for AddGame.xaml
    /// </summary>
    public partial class AddGame : Page
    {
        ShopGamesContext db = new ShopGamesContext();
        public AddGame()
        {
            InitializeComponent();
            
        }

        private void SaveBtn_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (db.Games.Any(x => x.Nazvanie == NazvanieBox.Text))
                {
                    MessageBox.Show("Игра уже существует!");
                }
                else
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


                        SystemRequirement sr = new SystemRequirement()
                        {
                            OS = OSBox.Text,
                            CPU = CPUBox.Text,
                            RAM = RamBox.Text,
                            GPU = GpuBox.Text,
                            Storage = StorageBox.Text,
                        };
                        sr = db.SystemRequirements.Add(sr);
                        db.SaveChanges();

                        Game newgame = new Game()
                        {
                            Nazvanie = NazvanieBox.Text,
                            idDeveloper = dev.IDDeveloper,
                            idPublisher = pub.IDPublisher,
                            Pablicationdate = Convert.ToDateTime(PubDate.Text),
                            Description = DescBox.Text,
                            Price = decimal.Parse(PriceBox.Text),
                            idSystemrequirements = sr.IDSystemRequirements,
                            Picture = PhotoBox.Text
                        };
                        db.Games.Add(newgame);
                        db.SaveChanges();

                        string[] genres = GenreBox.Text.Split(',');
                        foreach (string genrestr in genres)
                        {
                            var genre = db.Genres.Where(x => x.NazvaniaGenre.ToLower() == genrestr.Trim().ToLower()).FirstOrDefault();
                            if (genre != null)
                            {
                                db.GenreGames.Add(new GenreGame() { idgame = newgame.IDGames, idgenre = genre.IDGenre });
                            }
                            else
                            {
                                string genrestring = genrestr.Trim().ToUpper()[0] + genrestr.Remove(0, 2);
                                genre = db.Genres.Add(new Genre() { NazvaniaGenre = genrestring });
                                db.SaveChanges();
                                db.GenreGames.Add(new GenreGame() { idgame = newgame.IDGames, idgenre = genre.IDGenre });
                                db.SaveChanges();
                            }
                        }
                        MessageBox.Show("Игра добавлена!");
                    }
                }
            }
            catch (Exception ex)
            {
               MessageBox.Show(ex.Message.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error); 
            }
        }

        private void BackBtn_MouseDown(object sender, MouseButtonEventArgs e)
        {
            NavigationService.GoBack();
        }
    }
}

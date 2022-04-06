using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace GamesShop
{
    internal class Polzovatel
    {
        public static User mainuser { get; set;}

        public static List<Game> cartgames { get; set; }
        public static List<Game> wishgames { get; set; }
        public static void GetCartGames(ShopGamesContext db)
        {
            cartgames = (from game in db.Games
                         join cart in db.Carts on game.IDGames equals cart.idgame
                         join user in db.Users on cart.iduser equals user.IDUser
                         where user.IDUser == Polzovatel.mainuser.IDUser
                         select game).ToList();
        }

        public static void GetWishGames(ShopGamesContext db)
        {
            wishgames = (from game in db.Games
                     join wish in db.Wishlists on game.IDGames equals wish.idgame
                     join user in db.Users on wish.iduser equals user.IDUser
                     where user.IDUser == Polzovatel.mainuser.IDUser
                     select game).ToList();
        }

    }
}

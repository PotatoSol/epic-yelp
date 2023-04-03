using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace RestaurantApp.Models
{
  public class RestaurantAppContext : IdentityDbContext<ApplicationUser>
  {
    public DbSet<Restaurant> Restaurants { get; set; }
    public DbSet<Item> Items { get; set; }
    public DbSet<RestaurantItem> RestaurantItems { get; set; }
    public RestaurantAppContext(DbContextOptions<RestaurantAppContext> options ) : base(options) { }

}
}
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;

namespace RestaurantApp.Models
{
  public class RestaurantAppContext : IdentityDbContext<ApplicationUser>
  {
    public DbSet<Restaurant> Restaurants { get; set; }
    public DbSet<Item> Items { get; set; }
    public DbSet<RestaurantItem> RestaurantItems { get; set; }
    #nullable enable
    public RestaurantAppContext(DbContextOptions<RestaurantAppContext> options) : base (options) { }
    #nullable disable
    protected override void OnModelCreating(ModelBuilder builder)
    {
      base.OnModelCreating(builder);
      builder.Ignore<RestaurantItem>();
      
      builder.Entity<Restaurant>()
        .HasData(
          new Restaurant { RestaurantId = 1, RestaurantName = "Taco Bell", RestaurantHours = "08:00AM - 05:00PM" }
        );

      builder.Entity<Item>()
      .HasData(
        new Item { ItemId = 1, ItemName = "Burrito", ItemPrice = 1 }
      );

      // builder.Entity<RestaurantItem>()
      // .HasData(
      //   new RestaurantItem { RestaurantItemId = 1, RestaurantId = 1, ItemId = 1 }
      // );

    }
  }
}
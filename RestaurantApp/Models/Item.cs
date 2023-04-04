using System.ComponentModel.DataAnnotations;
namespace RestaurantApp.Models;


public class Item
{
  public int ItemId { get; set; }
  [Required]
  public string ItemName { get; set; }
  [Required]
  public double ItemPrice { get; set; }
  public List<RestaurantItem> JoinEntities { get; }
  public ApplicationUser User { get; set; }


}

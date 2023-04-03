using System.ComponentModel.DataAnnotations;
namespace RestaurantApp.Models;


public class Item
{
  public int ItemId { get; set; }
  [Required]
  public string ItemName { get; set; }
  [Required]
  public int ItemPrice { get; set; }
  #nullable enable
  public List<RestaurantItem> JoinEntities { get; }
  #nullable disable
  public ApplicationUser User { get; set; }


}

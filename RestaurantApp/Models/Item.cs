namespace RestaurantApp.Models;

public class Item
{
  public int ItemId { get; set; }
  public string ItemName { get; set; }
  public int ItemPrice { get; set; }
  public List<RestaurantItem> JoinEntities { get; }
  public ApplicationUser User { get; set; }


}

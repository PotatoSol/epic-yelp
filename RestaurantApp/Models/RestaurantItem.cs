namespace RestaurantApp.Models;

public class RestaurantItem
{
  public int RestaurantItemId { get; set; }
  public int RestaurantId { get; set; }
  public Restaurant Restaurant { get; set; }
  public int ItemId { get; set; }
  public Item Item { get; set; }


}

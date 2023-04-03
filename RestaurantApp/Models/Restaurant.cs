namespace RestaurantApp.Models;

public class Restaurant
{
    public int RestaurantId  { get; set; }
    public string RestaurantName {get; set;}

    public string RestaurantHours {get;set;}
 
    public List<RestaurantItem> JoinEntities { get;}
    public ApplicationUser User {get;set;}

   
}

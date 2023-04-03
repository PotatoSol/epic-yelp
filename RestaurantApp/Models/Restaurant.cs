using System.ComponentModel.DataAnnotations;
namespace RestaurantApp.Models;

public class Restaurant
{
    public int RestaurantId  { get; set; }
    [Required]
    public string RestaurantName {get; set;}
    [Required]
    public string RestaurantHours {get;set;}
    #nullable enable
    public List<RestaurantItem> JoinEntities { get;}
    #nullable disable
    public ApplicationUser User {get;set;}

}

using System.ComponentModel.DataAnnotations;
namespace RestaurantApp.Models;

public class Restaurant
{
    public int RestaurantId  { get; set; }
    [Required(ErrorMessage = "The Restaurant's description can't be empty!")]
    public string RestaurantName {get; set;}
    [Required]
    public string RestaurantHours {get;set;}
    public List<RestaurantItem> JoinEntities { get;}
    public List<RestaurantReview> ReviewJoin { get;}
    public ApplicationUser User {get;set;}

}

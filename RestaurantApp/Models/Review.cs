using System.Collections.Generic;
using System;
using System.ComponentModel.DataAnnotations;

namespace RestaurantApp.Models
{
  public class Review
  {
    public int ReviewId { get; set; }
    [Required(ErrorMessage = "The Review can't be empty!")]
    public string ReviewTitle { get; set; }
    [Required(ErrorMessage = "The Review can't be empty!")]
    public string ReviewText { get; set; }
    public DateTime ReviewDate { get; set; }
    public List<RestaurantReview> ReviewJoin { get;}
    public ApplicationUser User { get; set; }

  }
}
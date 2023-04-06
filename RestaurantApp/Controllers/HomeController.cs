using Microsoft.AspNetCore.Mvc;
using RestaurantApp.Models;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Security.Claims;
using Microsoft.AspNetCore.Authorization;


namespace RestaurantApp.Controllers
{
  public class HomeController : Controller
  {
    private readonly RestaurantAppContext _db;
    private readonly UserManager<ApplicationUser> _userManager;

    public HomeController(UserManager<ApplicationUser> userManager, RestaurantAppContext db)
    {
      _userManager = userManager;
      _db = db;
    }
      [HttpGet("/")]
      public async Task<IActionResult> Index()
      {
        if (User.Identity.IsAuthenticated){
        Item[] Items = _db.Items.ToArray();
        Dictionary<string,object[]> model = new Dictionary<string, object[]>();
        model.Add("Items", Items);
        string userId = this.User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        ApplicationUser currentUser = await _userManager.FindByIdAsync(userId);
        if (currentUser != null)
        {
          Restaurant[] Restaurants = _db.Restaurants
                      .Where(entry => entry.User.Id == currentUser.Id)
                      .ToArray();
          model.Add("Restaurants", Restaurants);
        }
        return View(model);
        }
        else{
          return View(_db.Restaurants.ToList());
        }
      }
  }
}
using Microsoft.AspNetCore.Mvc;
using RestaurantApp.Models;
using System.Linq;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace RestaurantApp.Controllers
{
  // [Authorize]
  public class RestaurantsController : Controller
  {
    private readonly RestaurantAppContext _db;

    public RestaurantsController(RestaurantAppContext db)
    {
      _db = db;
    }

    public ActionResult Index()
    {
      return View(_db.Restaurants.ToList());
    }

    public ActionResult Details(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants
          .Include(restaurant => restaurant.JoinEntities)
          .ThenInclude(join => join.Item)
          .Include(restaurant => restaurant.ReviewJoin)
          .ThenInclude(join => join.Review)
          .FirstOrDefault(restaurant => restaurant.RestaurantId == id);
      return View(thisRestaurant);
    }

    [HttpGet]
    public ActionResult Create()
    {
      return View();
    }

    [HttpPost]
    public ActionResult Create(Restaurant restaurant)
    {
      _db.Restaurants.Add(restaurant);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }

    public ActionResult AddItem(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants.FirstOrDefault(restaurants => restaurants.RestaurantId == id);
      ViewBag.ItemId = new SelectList(_db.Items, "ItemId", "ItemName");
      return View(thisRestaurant);
    }

    [HttpPost]
    public ActionResult AddItem(Restaurant restaurant, int itemId)
    {
#nullable enable
      RestaurantItem? joinEntity = _db.RestaurantItems.FirstOrDefault(join => (join.ItemId == itemId && join.RestaurantId == restaurant.RestaurantId));
#nullable disable
      if (joinEntity == null && itemId != 0)
      {
        _db.RestaurantItems.Add(new RestaurantItem() { ItemId = itemId, RestaurantId = restaurant.RestaurantId });
        _db.SaveChanges();
      }
      return RedirectToAction("Details", new { id = restaurant.RestaurantId });
    }
    public ActionResult AddReview(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants.FirstOrDefault(restaurants => restaurants.RestaurantId == id);
      ViewBag.ReviewId = new SelectList(_db.Reviews, "ReviewId", "ReviewTitle");
      return View(thisRestaurant);
    }

    [HttpPost]
    public ActionResult AddReview(Restaurant restaurant, int reviewId)
    {
#nullable enable
      RestaurantReview? joinEntity = _db.RestaurantReviews.FirstOrDefault(join => (join.ReviewId == reviewId && join.RestaurantId == restaurant.RestaurantId));
#nullable disable
      if (joinEntity == null && reviewId != 0)
      {
        _db.RestaurantReviews.Add(new RestaurantReview() { ReviewId = reviewId, RestaurantId = restaurant.RestaurantId });
        _db.SaveChanges();
      }
      return RedirectToAction("Details", new { id = restaurant.RestaurantId });
    }
    public ActionResult Edit(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants.FirstOrDefault(restaurants => restaurants.RestaurantId == id);
      return View(thisRestaurant);
    }

    [HttpPost]
    public ActionResult Edit(Restaurant restaurant)
    {
      _db.Restaurants.Update(restaurant);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }

    public ActionResult Delete(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants.FirstOrDefault(restaurants => restaurants.RestaurantId == id);
      return View(thisRestaurant);
    }

    [HttpPost, ActionName("Delete")]
    public ActionResult DeleteConfirmed(int id)
    {
      Restaurant thisRestaurant = _db.Restaurants.FirstOrDefault(restaurants => restaurants.RestaurantId == id);
      _db.Restaurants.Remove(thisRestaurant);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }

    [HttpPost]
    public ActionResult DeleteJoin(int joinId)
    {
      RestaurantItem joinEntry = _db.RestaurantItems.FirstOrDefault(entry => entry.RestaurantItemId == joinId);
      _db.RestaurantItems.Remove(joinEntry);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }
  }
}
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using RestaurantApp.Models;
using System.Collections.Generic;
using System.Linq;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using System.Threading.Tasks;
using System.Security.Claims;

namespace RestaurantApp.Controllers
{
  [Authorize]
  public class ReviewsController : Controller
  {
    private readonly RestaurantAppContext _db;
    private readonly UserManager<ApplicationUser> _userManager;

    public ReviewsController(UserManager<ApplicationUser> userManager, RestaurantAppContext db)
    {
      _userManager = userManager;
      _db = db;
    }

    public async Task<IActionResult> Index(string sortOrder)
    {
      string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
      ApplicationUser currentUser = await _userManager.FindByIdAsync(userId);
      List<Review> userReviews = _db.Reviews
                          .Where(entry => entry.User.Id == currentUser.Id)
                          .Include(review => review.ReviewJoin)
                          .ToList();
      // return View(userReviews);

      var reviews = from r in userReviews
                   select r;

      switch (sortOrder)
      {
        case "name_desc":
          reviews = userReviews.OrderBy(r => r.ReviewTitle);
          break;
        // case "price_desc":
        //   reviews = userReviews.OrderByDescending(r => r.ReviewPrice);
        //   break;
        default:
          reviews = userReviews.OrderBy(r => r.ReviewId);
          break;
      }
      return View(reviews.ToList());
    }

    public ActionResult Create()
    {
      ViewBag.RestaurantId = new SelectList(_db.Restaurants, "RestaurantId", "RestaurantName");
      return View();
    }

    [HttpPost]
    public async Task<ActionResult> Create(Review review, int restaurantId)
    {
      if (!ModelState.IsValid)
      {
        return View(review);
      }
      else
      {
        string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        ApplicationUser currentUser = await _userManager.FindByIdAsync(userId);
        review.User = currentUser;
        _db.Reviews.Add(review);
        _db.SaveChanges();
    #nullable enable
      RestaurantReview? joinEntity = _db.RestaurantReviews.FirstOrDefault(join => (join.RestaurantId == restaurantId && join.ReviewId == review.ReviewId));
    #nullable disable
      if (joinEntity == null && restaurantId != 0)
      {
        _db.RestaurantReviews.Add(new RestaurantReview() { RestaurantId = restaurantId, ReviewId = review.ReviewId });
        _db.SaveChanges();
      }
        return RedirectToAction("Details","Restaurants", new { id = restaurantId });
      }
    }

    public ActionResult Details(int id)
    {
      Review thisReview = _db.Reviews
          .Include(review => review.ReviewJoin)
          .ThenInclude(join => join.Restaurant)
          .FirstOrDefault(review => review.ReviewId == id);
      return View(thisReview);
    }

    public ActionResult Edit(int id)
    {
      Review thisReview = _db.Reviews.FirstOrDefault(review => review.ReviewId == id);
      //ViewBag.CategoryId = new SelectList(_db.Categories, "CategoryId", "Name");
      return View(thisReview);
    }


    [HttpPost]
    public ActionResult Edit(Review review)
    {
      _db.Reviews.Update(review);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }
    public ActionResult Delete(int id)
    {
      Review thisReview = _db.Reviews.FirstOrDefault(review => review.ReviewId == id);
      return View(thisReview);
    }

    [HttpPost, ActionName("Delete")]
    public ActionResult DeleteConfirmed(int id)
    {
      Review thisReview = _db.Reviews.FirstOrDefault(review => review.ReviewId == id);
      _db.Reviews.Remove(thisReview);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }

    public ActionResult AddRestaurant(int id)
    {
      Review thisReview = _db.Reviews.FirstOrDefault(reviews => reviews.ReviewId == id);
      ViewBag.RestaurantId = new SelectList(_db.Restaurants, "RestaurantId", "RestaurantName");
      return View(thisReview);
    }

    [HttpPost]
    public ActionResult AddRestaurant(Review review, int restaurantId)
    {
#nullable enable
      RestaurantReview? joinEntity = _db.RestaurantReviews.FirstOrDefault(join => (join.RestaurantId == restaurantId && join.ReviewId == review.ReviewId));
#nullable disable
      if (joinEntity == null && restaurantId != 0)
      {
        _db.RestaurantReviews.Add(new RestaurantReview() { RestaurantId = restaurantId, ReviewId = review.ReviewId });
        _db.SaveChanges();
      }
      return RedirectToAction("Details", new { id = review.ReviewId });
    }
   [HttpPost]

    [HttpPost]
    public ActionResult DeleteJoin(int joinId, int restaurantId )
    {
      RestaurantReview joinEntry = _db.RestaurantReviews.FirstOrDefault(entry => entry.RestaurantReviewId == joinId);
      _db.RestaurantReviews.Remove(joinEntry);
      _db.SaveChanges();
      return RedirectToAction("Details","Restaurants", new { id = restaurantId } );
    }
  }
}

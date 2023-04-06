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
  // [Authorize]
  public class ItemsController : Controller
  {
    private readonly RestaurantAppContext _db;
    private readonly UserManager<ApplicationUser> _userManager;

    public ItemsController(UserManager<ApplicationUser> userManager, RestaurantAppContext db)
    {
      _userManager = userManager;
      _db = db;
    }

    public ActionResult Index(string sortOrder)
    {
      // string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
      // ApplicationUser currentUser = await _userManager.FindByIdAsync(userId);
      List<Item> allItems = _db.Items
                          .Include(item => item.JoinEntities)
                          .ToList();
      // return View(userItems);

      var items = from r in allItems
                   select r;

      switch (sortOrder)
      {
        case "name_desc":
          items = allItems.OrderBy(r => r.ItemName);
          break;
        case "price_desc":
          items = allItems.OrderByDescending(r => r.ItemPrice);
          break;
        default:
          items = allItems.OrderBy(r => r.ItemId);
          break;
      }
      
      return View(items.ToList());
    }

    public ActionResult Create()
    {
      return View();
    }

    [HttpPost]
    public async Task<ActionResult> Create(Item item)
    {
      if (!ModelState.IsValid)
      {
        return View(item);
      }
      else
      {
        string userId = User.FindFirst(ClaimTypes.NameIdentifier)?.Value;
        ApplicationUser currentUser = await _userManager.FindByIdAsync(userId);
        item.User = currentUser;
        _db.Items.Add(item);
        _db.SaveChanges();
        return RedirectToAction("Index");
      }
    }

    public ActionResult Details(int id)
    {
      Item thisItem = _db.Items
          .Include(item => item.JoinEntities)
          .ThenInclude(join => join.Restaurant)
          .FirstOrDefault(item => item.ItemId == id);
      return View(thisItem);
    }

    public ActionResult Edit(int id)
    {
      Item thisItem = _db.Items.FirstOrDefault(item => item.ItemId == id);
      //ViewBag.CategoryId = new SelectList(_db.Categories, "CategoryId", "Name");
      return View(thisItem);
    }


    [HttpPost]
    public ActionResult Edit(Item item)
    {
      _db.Items.Update(item);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }
    public ActionResult Delete(int id)
    {
      Item thisItem = _db.Items.FirstOrDefault(item => item.ItemId == id);
      return View(thisItem);
    }

    [HttpPost, ActionName("Delete")]
    public ActionResult DeleteConfirmed(int id)
    {
      Item thisItem = _db.Items.FirstOrDefault(item => item.ItemId == id);
      _db.Items.Remove(thisItem);
      _db.SaveChanges();
      return RedirectToAction("Index");
    }

    public ActionResult AddRestaurant(int id)
    {
      Item thisItem = _db.Items.FirstOrDefault(items => items.ItemId == id);
      ViewBag.RestaurantId = new SelectList(_db.Restaurants, "RestaurantId", "RestaurantName");
      return View(thisItem);
    }

    [HttpPost]
    public ActionResult AddRestaurant(Item item, int restaurantId)
    {
#nullable enable
      RestaurantItem? joinEntity = _db.RestaurantItems.FirstOrDefault(join => (join.RestaurantId == restaurantId && join.ItemId == item.ItemId));
#nullable disable
      if (joinEntity == null && restaurantId != 0)
      {
        _db.RestaurantItems.Add(new RestaurantItem() { RestaurantId = restaurantId, ItemId = item.ItemId });
        _db.SaveChanges();
      }
      return RedirectToAction("Details", new { id = item.ItemId });
    }
    [HttpPost]

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

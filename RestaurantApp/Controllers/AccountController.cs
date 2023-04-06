
using System.Threading.Tasks;
using RestaurantApp.ViewModels;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using RestaurantApp.Models;

namespace RestaurantApp.Controllers
{
  public class AccountController : Controller
  {
    private readonly RestaurantAppContext _db;
    private UserManager<ApplicationUser> userManager;
    private IPasswordHasher<ApplicationUser> passwordHasher;
    private SignInManager<ApplicationUser> signInManager;

    public AccountController(UserManager<ApplicationUser> userMgr, SignInManager<ApplicationUser> signinMgr, IPasswordHasher<ApplicationUser> passwordHash, RestaurantAppContext db)
    {
      userManager = userMgr;
      signInManager = signinMgr;
      passwordHasher = passwordHash;
      _db = db;
    }
        public IActionResult Index()
    {
      return View(userManager.Users);
    }
     public IActionResult Register()
    {
      return View();
    }
    [HttpPost]
    public async Task<ActionResult> Register(RegisterViewModel model)
    {
      if (!ModelState.IsValid)
      {
        return View(model);
      }
      else
      {
        ApplicationUser user = new ApplicationUser
        {
          UserName = model.Email,
          Email = model.Email,

        };
        IdentityResult result = await userManager.CreateAsync(user, model.Password);
        if (result.Succeeded)
        {
          return RedirectToAction("Index");
        }
        else
        {
          foreach (IdentityError error in result.Errors)
          {
            ModelState.AddModelError("", error.Description);
          }
          return View(model);
        }
      }
    }

    [AllowAnonymous]
    public IActionResult Login(string returnUrl)
    {
      Login login = new Login();
      login.ReturnUrl = returnUrl;
      return View(login);
    }

    [HttpPost]
    [AllowAnonymous]
    [ValidateAntiForgeryToken]
    public async Task<IActionResult> Login(Login login)
    {
      if (ModelState.IsValid)
      {
        ApplicationUser appUser = await userManager.FindByEmailAsync(login.Email);
        if (appUser != null)
        {
          await signInManager.SignOutAsync();
          Microsoft.AspNetCore.Identity.SignInResult result = await signInManager.PasswordSignInAsync(appUser, login.Password, false, false);
          if (result.Succeeded)
            return Redirect(login.ReturnUrl ?? "/");
        }
        ModelState.AddModelError(nameof(login.Email), "Login Failed: Invalid Email or password");
      }
      return View(login);
    }
    public async Task<IActionResult> LogOff()
    {
      await signInManager.SignOutAsync();
      return RedirectToAction("Index", "Home");
    }
    public IActionResult AccessDenied()
    {
      return View();
    }

  }
}
// using Microsoft.AspNetCore.Mvc;
// using Microsoft.AspNetCore.Identity;
// using Microsoft.AspNetCore.Authorization;
// using RestaurantApp.Models;
using System.Threading.Tasks;
using RestaurantApp.ViewModels;

// namespace RestaurantApp.Controllers
// {
//   // [Authorize]
//   public class AccountController : Controller
//   {
//     private readonly RestaurantAppContext _db;
//     private UserManager<ApplicationUser> _userManager;
//     private IPasswordHasher<ApplicationUser> passwordHasher;

//     private SignInManager<ApplicationUser> _signInManager;

//     public AccountController(UserManager<ApplicationUser> userManager, SignInManager<ApplicationUser> signInManager, IPasswordHasher<ApplicationUser> passwordHash, RestaurantAppContext db)
//     {
//       _userManager = userManager;
//       passwordHasher = passwordHash;
//       _signInManager = signInManager;
//       _db = db;
//     }

//     public IActionResult Index()
//     {
//       return View(_userManager.Users);
//     }

//     public ActionResult Register()
//     {
//       return View();
//     }

//     [HttpPost]
//     public async Task<ActionResult> Register(RegisterViewModel model)
//     {
//       if (!ModelState.IsValid)
//       {
//         return View(model);
//       }
//       else
//       {
//         ApplicationUser user = new ApplicationUser
//         {
//           UserName = model.Email,
//           Email = model.Email,

//         };
//         IdentityResult result = await _userManager.CreateAsync(user, model.Password);
//         if (result.Succeeded)
//         {
//           return RedirectToAction("Index");
//         }
//         else
//         {
//           foreach (IdentityError error in result.Errors)
//           {
//             ModelState.AddModelError("", error.Description);
//           }
//           return View(model);
//         }
//       }
//     }
//     public ActionResult Login()
//     {
//       return View();
//     }

//     [HttpPost]
//     public async Task<ActionResult> Login(LoginViewModel model)
//     {
//       if (!ModelState.IsValid)
//       {
//         return View(model);
//       }
//       else
//       {
//         Microsoft.AspNetCore.Identity.SignInResult result = await _signInManager.PasswordSignInAsync(model.Email, model.Password, isPersistent: true, lockoutOnFailure: false);
//         if (result.Succeeded)
//         {
//           return RedirectToAction("Index");
//         }
//         else
//         {
//           ModelState.AddModelError("", "There is something wrong with your email or username. Please try again.");
//           return View(model);
//         }
//       }
//     }
//     [HttpPost]
//     public async Task<ActionResult> LogOff()
//     {
//       await _signInManager.SignOutAsync();
//       return RedirectToAction("Index");
//     }
//             public async Task<IActionResult> Update(string id)
//         {
//             ApplicationUser user = await _userManager.FindByIdAsync(id);
//             if (user != null)
//                 return View(user);
//             else
//                 return RedirectToAction("Index");
//         }

//         [HttpPost]
//         public async Task<IActionResult> Update(string id, string email, string password)
//         {
//             ApplicationUser user = await _userManager.FindByIdAsync(id);
//             if (user != null)
//             {
//                 if (!string.IsNullOrEmpty(email))
//                     user.Email = email;
//                 else
//                     ModelState.AddModelError("", "Email cannot be empty");

//                 if (!string.IsNullOrEmpty(password))
//                     user.PasswordHash = passwordHasher.HashPassword(user, password);
//                 else
//                     ModelState.AddModelError("", "Password cannot be empty");

//                 if (!string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(password))
//                 {
//                     IdentityResult result = await _userManager.UpdateAsync(user);
//                     if (result.Succeeded)
//                         return RedirectToAction("Index");
//                     else
//                         Errors(result);
//                 }
//             }
//             else
//                 ModelState.AddModelError("", "User Not Found");
//             return View(user);
//         }

//         private void Errors(IdentityResult result)
//         {
//             foreach (IdentityError error in result.Errors)
//                 ModelState.AddModelError("", error.Description);
//         }
//                 [HttpPost]
//         public async Task<IActionResult> Delete(string id)
//         {
//             ApplicationUser user = await _userManager.FindByIdAsync(id);
//             if (user != null)
//             {
//                 IdentityResult result = await _userManager.DeleteAsync(user);
//                 if (result.Succeeded)
//                     return RedirectToAction("Index");
//                 else
//                     Errors(result);
//             }
//             else
//                 ModelState.AddModelError("", "User Not Found");
//             return View("Index", _userManager.Users);
//         }
//   }
// }
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
    public ActionResult Login()
    {
      return View();
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
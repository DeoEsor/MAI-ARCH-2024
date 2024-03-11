using Microsoft.AspNetCore.Mvc;

namespace TCS.Trip.Creator.Presentation.Controllers;

[ApiController]
[Route("[controller]")]
public class UserFacadeController : ControllerBase
{
    [HttpPost]
    [Route(nameof(Test))]
    public IActionResult Test(int i)
    {
        return Ok();
    }
}
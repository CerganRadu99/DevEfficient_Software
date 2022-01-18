using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using WebApi.Dtos;

namespace WebApi.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class BaseController : Controller
    {
        protected ResponseDto<T> HandleResponse<T>(T data, List<string> errors = null) where T : class
        {
            if (errors is null || errors.Count == 0)
            {
                return ResponseDto<T>.Success(data);
            }
            else
            {
                return ResponseDto<T>.Failure(errors);
            }
        }
        protected ResponseDto HandleResponse(List<string> errors = null)
        {
            if (errors is null || errors.Count == 0)
            {
                return ResponseDto.Success();
            }
            else
            {
                return ResponseDto.Failure(errors);
            }
        }
    }
}

using AutoMapper;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;
using WebApi.Dtos;
using WebApi.Helpers;
using WebApi.Validation;

namespace WebApi.Controllers
{
    public class AccountController: BaseController
    {
        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        private readonly JwtConfig _jwtConfig;
        private readonly IMapper _mapper;
        public AccountController(UserManager<IdentityUser> userManager, IOptionsMonitor<JwtConfig> optionsMonitor, IMapper mapper, RoleManager<IdentityRole> roleManager)
        {
            _userManager = userManager;
            _roleManager = roleManager;
            _jwtConfig = optionsMonitor.CurrentValue;
            _mapper = mapper;
        }

        [Route("register")]
        [HttpPost]
        public async Task<ActionResult<ResponseDto>> Register([FromBody] UserRegistrationDto userRegistrationDto)
        {
            if (ModelState.IsValid)
            {
                var user = _mapper.Map<IdentityUser>(userRegistrationDto);
                var result = await _userManager.CreateAsync(user, userRegistrationDto.PasswordHash);
                if(result.Succeeded)
                {
                    var userRole = await _roleManager.FindByNameAsync("User");
                    if(userRole != null)
                    {
                        IdentityResult roleResult = await _userManager.AddToRoleAsync(user, userRole.Name);
                        if(roleResult.Succeeded)
                        {
                            return base.HandleResponse();
                        }
                    }
                    return base.HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
                }
                return base.HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
            else
            {
                return base.HandleResponse(DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        [Route("login")]
        [HttpPost]
        [ProducesResponseType((typeof(ResponseDto<SignInResponse>)), 200)]
        [ProducesResponseType(400)]
        public async Task<ActionResult<ResponseDto<SignInResponse>>> Login([FromBody] UserDto userDto)
        {
            if (ModelState.IsValid)
            {
                var existingUser = await _userManager.FindByNameAsync(userDto.UserName);
                if (existingUser is not null)
                {
                    var checkedPasswordFlag = await _userManager.CheckPasswordAsync(existingUser, userDto.Password);
                    var roles = await _userManager.GetRolesAsync(existingUser);
                    if (checkedPasswordFlag && roles.Count == 1)
                    {
                        var jwtToken = GenerateJwtToken(existingUser);
                        return base.HandleResponse<SignInResponse>(new SignInResponse
                        {
                            AccessToken = jwtToken,
                            Role = roles[0],
                            Email = existingUser.Email,
                            Username = existingUser.UserName
                        });
                    }
                    return base.HandleResponse<SignInResponse>(null, DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
                }
                else
                {
                    ModelState.AddModelError(string.Empty, "Invalid login attempt");
                    return base.HandleResponse<SignInResponse>(null, DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
                }
            }
            else
            {
                return base.HandleResponse<SignInResponse>(null, DefaultErrors.GetErrors(DefaultErrors.BadRequestError));
            }
        }

        private string GenerateJwtToken(IdentityUser user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_jwtConfig.Secret);
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("Id", user.Id),
                    new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString())
                }),
                Expires = DateTime.UtcNow.AddHours(6),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = jwtTokenHandler.CreateToken(tokenDescriptor);
            var jwtToken = jwtTokenHandler.WriteToken(token);
            return jwtToken;
        }

    }
}

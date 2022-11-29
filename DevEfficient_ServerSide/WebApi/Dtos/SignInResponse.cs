using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace WebApi.Dtos
{
    public class SignInResponse
    {
        public string AccessToken { get; set; }
        public string Role { get; set; }
        public string Email { get; set; }
        public string Username { get; set; }
    }
}

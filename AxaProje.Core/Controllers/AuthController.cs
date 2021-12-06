using AxaProje.Core.Models;
using AxaProje.Data.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace AxaProje.Core.Controllers
{
    [ApiController]
    [Route("[controller]")]
    public class AuthController : Controller
    {
        private readonly AxaProjeDBContext _context;

        private readonly IConfiguration _configuration;

        public AuthController(AxaProjeDBContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }

        [HttpPost]
        public ApiResponse GetLogin(LoginModel loginModel)
        {

            var user = _context.Users.FirstOrDefault(u=>u.UserName==loginModel.UserName && u.Password==loginModel.Password);

            if (user==null)
                return new ApiResponse { Code = 200, Message = "Böyle kullanıcı yok" };


            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,loginModel.UserName),
                new Claim(JwtRegisteredClaimNames.Jti,Guid.NewGuid().ToString())

            };

            var securityKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration["SigninKey"]));


            var credantials = new SigningCredentials(securityKey,SecurityAlgorithms.HmacSha256);


            var tokenHandler = new JwtSecurityToken(
                issuer:_configuration["Issuer"],
                audience: _configuration["Audience"],
                claims:claims,
                expires:DateTime.UtcNow.AddDays(30),
                notBefore:DateTime.UtcNow,
                signingCredentials:credantials
               );

            IdentityModelEventSource.ShowPII=true;

            var token = new JwtSecurityTokenHandler().WriteToken(tokenHandler);
            user.TokenKey = token;
            _context.SaveChanges();


            var log = JsonConvert.SerializeObject(loginModel);

            ActionLog logInfo = new ActionLog();
            logInfo.ActionInfo = "Giriş/Login";
            logInfo.AcLog = log;
            logInfo.Date = DateTime.Now;
            _context.ActionLogs.Add(logInfo);
            var result = _context.SaveChanges();

            //_context.ActionLogs.Add(customer);
            //var result = _context.SaveChanges();


            return new ApiResponse { Code = 200, Message = "Başarılı", Set = token };
        }
    }
}

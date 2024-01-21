using AppDomain.Modules.AuthModule.Entities;
using AppInfra.Contracts;
using Jiraya.API.Data;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Buffers.Text;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Runtime.ConstrainedExecution;
using System.Security.Claims;
using System.Text;
using System.Threading.Tasks;

namespace AppInfra.Services
{
    public class TokenService : ITokenService
    {
        private readonly JwtSecurityTokenHandler _tokenHandler;
        public TokenService(JwtSecurityTokenHandler tokenHandler)
        {
            _tokenHandler = tokenHandler;
        }
        public string GetToken(AuthCredentials credentials)
        {
            string key = AppSecret.SecretKey;
            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(
                    new Claim[]{
                        new Claim(ClaimTypes.Name, credentials.Name ?? ""),
                        new Claim(ClaimTypes.Upn, credentials.Id.ToString()),
                    }),
                SigningCredentials = new SigningCredentials(
                    new SymmetricSecurityKey(Encoding.ASCII.GetBytes(key)),
                    SecurityAlgorithms.HmacSha256Signature),
                Expires = DateTime.UtcNow.AddHours(10)
            };
            SecurityToken token = _tokenHandler.CreateToken(tokenDescriptor);
            return _tokenHandler.WriteToken(token);
        }
    }
}

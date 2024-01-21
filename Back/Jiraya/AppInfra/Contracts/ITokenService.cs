
using AppDomain.Modules.AuthModule.Entities;

namespace AppInfra.Contracts
{
    public interface ITokenService
    {
        string GetToken(AuthCredentials credentials);
    }
}

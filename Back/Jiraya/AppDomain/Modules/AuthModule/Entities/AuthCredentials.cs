using AppDomain.Modules.UserModule;

namespace AppDomain.Modules.AuthModule.Entities
{
    public class AuthCredentials : BaseEntity
    {
        public UserRole Role { get; set; }
    }
}

using AppApplication.Modules.UserModule.Dtos;
using AppDomain.Modules.UserModule.Entities;

namespace AppApplication.Modules.UserModule.Extensions
{
    public static class UserExtension
    {
        public static UserDto AsDto(this User user)
        {
            return new UserDto
                (
                user.Id,
                user.Name,
                user.Code,
                user.Role
                );
        }
    }
}

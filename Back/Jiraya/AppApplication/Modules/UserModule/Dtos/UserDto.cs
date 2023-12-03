using AppDomain.Modules.UserModule;
namespace AppApplication.Modules.UserModule.Dtos
{
    public class UserDto
    {
        public UserDto(Guid id, string name, string code, UserRole role)
        {
            Id = id;
            Name = name;
            Code = code;
            Role = role;
        }

        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public string Code { get; private set; }
        public UserRole Role { get; private set; }
    }
}

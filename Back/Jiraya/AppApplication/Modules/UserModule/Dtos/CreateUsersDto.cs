
namespace AppApplication.Modules.UserModule.Dtos
{
    public class CreateUsersDto
    {
        public CreateUsersDto(string? name, string? code)
        {
            Name = name;
            Code = code;
        }
        public string? Name { get; private set; }
        public string? Code { get; private set; }
    }
}

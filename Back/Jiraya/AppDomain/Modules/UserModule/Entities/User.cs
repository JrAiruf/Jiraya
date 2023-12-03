using AppDomain.Validators;

namespace AppDomain.Modules.UserModule.Entities
{
    public class User : BaseEntity
    {
        private readonly UserValidator _validator = new UserValidator();

        public User(string name, string code)
        {
            ChangeName(name);
            ChangeCode(code);
        }

        public string? Code { get; private set; }
        public UserRole Role { get; private set; } = UserRole.User;

        public void ChangeCode(string code)
        {
            Code = code;
            _validator.ValidateCode(Code);
        }

        public User() { }
    }
}

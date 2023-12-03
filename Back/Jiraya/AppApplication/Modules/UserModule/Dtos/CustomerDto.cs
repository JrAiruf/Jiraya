using AppDomain.Modules.UserModule;

namespace AppApplication.Modules.UserModule.Dtos
{
    public class CustomerDto
    {
        public CustomerDto(Guid id, string name, string phone,AddressDto address, UserRole role)
        {
            Id = id;
            Name = name;
            Phone = phone;
            Address = address;
            Role = role;
        }
        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public string Phone { get; private set; }
        public AddressDto Address { get; private set; }
        public UserRole Role { get; private set; }

    }
}

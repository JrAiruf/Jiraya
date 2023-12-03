
namespace AppApplication.Modules.UserModule.Dtos
{
    public class CreateCustomerDto
    {
        public CreateCustomerDto(string name, string phone,CreateAddressDto address)
        {
            Name = name;
            Phone = phone;
            Address = address;
        }
        public string Name { get; private set; }
        public string Phone { get; private set; }
        public CreateAddressDto Address { get; private set; }
    }
}

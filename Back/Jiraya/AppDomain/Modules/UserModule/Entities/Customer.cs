using AppDomain.Modules.ProductsModule.Entities;
using AppDomain.Validators;

namespace AppDomain.Modules.UserModule.Entities
{
    public class Customer : BaseEntity
    {
        private readonly AddressValidator _validator = new();
        private readonly UserValidator _userValidator = new();
        public Customer(string name, string phone, Address address)
        {
            ChangeName(name);
            ChangePhone(phone);
            ChangeAddress(address);
        }
        public Customer(Guid id, string name, string phone, Address address)
        {
            Id = id;
            ChangeName(name);
            ChangePhone(phone);
            ChangeAddress(address);
        }
        public string? Phone { get; private set; }
        public Address? Address { get; private set; }
        public List<ProductOrder> ProductOrders { get; private set; }
        public UserRole Role { get; private set; } = UserRole.Customer;

        public void ChangeAddress(Address address)
        {
            _validator.ValidateNeighborhood(address.Neighborhood);
            _validator.ValidateStreetName(address.StreetAddress);
            _validator.ValidateNumber(address.AddressNumber);
            Address = address;
        }
        public void ChangePhone(string phone)
        {
            _userValidator.ValidatePhone(phone);
            Phone = phone;
        }

        public Customer() { }
    }
}

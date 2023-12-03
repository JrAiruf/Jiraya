using AppDomain.Validators;
using System.Text.Json.Serialization;

namespace AppDomain.Modules.UserModule.Entities
{
    public class Address
    {
        private readonly AddressValidator _validator = new AddressValidator();
        public Address(Guid id, string neighborhood, string streetAddress, int addressNumber)
        {
            Id = id;
            ChangeNeighborhood(neighborhood);
            ChangeStreetAddress(streetAddress);
            ChangeAddressNumber(addressNumber);
        }
        public Address(string neighborhood, string streetAddress, int addressNumber)
        {
            Id = Guid.NewGuid();
            ChangeNeighborhood(neighborhood);
            ChangeStreetAddress(streetAddress);
            ChangeAddressNumber(addressNumber);
        }

        public Guid Id { get; private set; }
        public string Neighborhood { get; private set; }
        public string StreetAddress { get; private set; }
        public int AddressNumber { get; private set; }
        [JsonIgnore]
        public List<Customer> Customers { get; private set; }

        public void ChangeNeighborhood(string neighborhood)
        {
            Neighborhood = neighborhood;
            _validator.ValidateNeighborhood(Neighborhood);
        }
        public void ChangeStreetAddress(string streetAddress)
        {
            StreetAddress = streetAddress;
            _validator.ValidateStreetName(StreetAddress);
        }
        public void ChangeAddressNumber(int addressNumber)
        {
            AddressNumber = addressNumber;
            _validator.ValidateNumber(AddressNumber);
        }

        public Address() { }
    }
}

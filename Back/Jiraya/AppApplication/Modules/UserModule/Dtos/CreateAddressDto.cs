namespace AppApplication.Modules.UserModule.Dtos
{
    public class CreateAddressDto
    {
        public CreateAddressDto(string neighborhood, string streetAddress, int addressNumber)
        {
            Neighborhood = neighborhood;
            StreetAddress = streetAddress;
            AddressNumber = addressNumber;
        }
        public string Neighborhood { get; private set; }
        public string StreetAddress { get; private set; }
        public int AddressNumber { get; private set; }
    }
}

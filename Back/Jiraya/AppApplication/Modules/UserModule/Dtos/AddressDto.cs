namespace AppApplication.Modules.UserModule.Dtos
{
    public class AddressDto
    {

        public AddressDto(Guid id, string neighborhood, string streetAddress, int addressNumber)
        {
            Id = id;
            Neighborhood = neighborhood;
            StreetAddress = streetAddress;
            AddressNumber = addressNumber;
        }
        public Guid Id { get; private set; }
        public string Neighborhood { get; private set; }
        public string StreetAddress { get; private set; }
        public int AddressNumber { get; private set; }
    }
}

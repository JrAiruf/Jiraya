using AppApplication.Modules.UserModule.Dtos;
using AppDomain.Modules.UserModule.Entities;

namespace AppApplication.Modules.UserModule.Extensions
{
    public static class AddressExtension
    {
        public static AddressDto AsDto(this Address address)
        {
            return new AddressDto(
                address.Id,
                address.Neighborhood,
                address.StreetAddress,
                address.AddressNumber);
        }public static Address AsEntity(this AddressDto address)
        {
            return new Address(
                address.Id,
                address.Neighborhood,
                address.StreetAddress,
                address.AddressNumber);
        }
    }
}

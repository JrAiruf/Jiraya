using AppApplication.Modules.UserModule.Dtos;
using AppDomain.Modules.UserModule.Entities;

namespace AppApplication.Modules.UserModule.Extensions
{
    public static class CustomerExtension
    {
        public static CustomerDto AsDto(this Customer customer)
        {
            return new CustomerDto(
                customer.Id,
                customer.Name,
                customer.Phone,
                customer.Address.AsDto(),
                customer.Role);
        }
        public static Customer AsEntity(this CustomerDto customer)
        {
            return new Customer(
                customer.Id,
                customer.Name,
                customer.Phone,
                customer.Address.AsEntity());
        }
    }
}

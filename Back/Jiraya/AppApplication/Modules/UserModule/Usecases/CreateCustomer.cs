using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class CreateCustomer
    {
        private readonly IUserRepository _repository;
        public CreateCustomer(IUserRepository repository)
        {
            _repository = repository;
        }
        public async Task Handle(Customer customer)
        {
            await _repository.CreateCustomerAsync(customer);
        }
    }
}

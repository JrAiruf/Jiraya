using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class UpdateCustomer
    {
        private readonly IUserRepository _repository;

        public UpdateCustomer(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Customer customer)
        {
            await _repository.UpdateCustomerAsync(customer);
        }
    }
}

using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class GetCustomer
    {
        private readonly IUserRepository _repository;
        public GetCustomer(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task<Customer> Handle(Guid id)
        {
            return await _repository.GetCustomerAsync(id);
        }
    }
}

using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class GetCustomers
    {
        private readonly IUserRepository _repository;
        public GetCustomers(IUserRepository repository)
        {
            _repository = repository;
        }
        public async Task<List<Customer>> Handle()
        {
            return await _repository.GetCustomersAsync();
        }
    }
}

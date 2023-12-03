using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class DeleteCustomer
    {
        private readonly IUserRepository _repository;

        public DeleteCustomer(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Guid id)
        {
            await _repository.DeleteCustomerAsync(id);
        }
    }
}

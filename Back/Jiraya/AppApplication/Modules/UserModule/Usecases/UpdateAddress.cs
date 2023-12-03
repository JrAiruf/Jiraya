using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class UpdateAddress
    {
        private readonly IUserRepository _repository;

        public UpdateAddress(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Address address)
        {
            await _repository.UpdateAddressAsync(address);
        }
    }
}

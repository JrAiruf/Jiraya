using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class CreateUser
    {
        private readonly IUserRepository _repository;
        public CreateUser(IUserRepository repository)
        {
            _repository = repository;
        }
        public async Task Handle(User user)
        {
            await _repository.CreateUserAsync(user);
        }
    }
}

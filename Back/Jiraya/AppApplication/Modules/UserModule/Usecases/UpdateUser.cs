using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class UpdateUser
    {
        private readonly IUserRepository _repository;
        public UpdateUser(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(User user)
        {
            await _repository.UpdateUserAsync(user);
        }
    }
}

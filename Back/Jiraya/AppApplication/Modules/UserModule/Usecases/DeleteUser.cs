using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class DeleteUser
    {
        private readonly IUserRepository _repository;
        public DeleteUser(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task Handle(Guid id)
        {
            await _repository.DeleteUserAsync(id);
        }
    }
}

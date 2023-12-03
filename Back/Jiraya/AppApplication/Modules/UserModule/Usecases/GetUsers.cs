using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class GetUsers
    {
        private readonly IUserRepository _repository;
        public GetUsers(IUserRepository repository)
        {
            _repository = repository;
        }
        public async Task<List<User>> Handle()
        {
            return await _repository.GetUsersAsync();
        }
    }
}

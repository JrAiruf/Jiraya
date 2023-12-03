using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppApplication.Modules.UserModule.Usecases
{
    public class GetUser
    {
        private readonly IUserRepository _repository;
        public GetUser(IUserRepository repository)
        {
            _repository = repository;
        }

        public async Task<User> Handle(Guid id)
        {
            return await _repository.GetUserAsync(id);
        }
    }
}

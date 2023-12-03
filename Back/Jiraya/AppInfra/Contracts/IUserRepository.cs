using AppDomain.Modules.UserModule.Entities;

namespace AppInfra.Contracts

{
    public interface IUserRepository
    {
        public Task CreateUserAsync(User user);
        public Task CreateCustomerAsync(Customer user);
        public Task<List<Customer>> GetCustomersAsync();
        public Task<Customer> GetCustomerAsync(Guid id);
        public Task UpdateCustomerAsync(Customer customer);
        public Task DeleteCustomerAsync(Guid id);
        public Task<List<User>> GetUsersAsync();
        public Task<User> GetUserAsync(Guid id);
        public Task UpdateUserAsync(User user);
        public Task UpdateAddressAsync(Address address);
        public Task DeleteUserAsync(Guid id);
    }
}

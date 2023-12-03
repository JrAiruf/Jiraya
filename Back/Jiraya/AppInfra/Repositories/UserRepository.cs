using AppDomain.Modules.UserModule.Entities;
using AppInfra.Contracts;
using AppInfra.Data;
using Microsoft.EntityFrameworkCore;

namespace AppInfra.Repositories
{
    public class UserRepository : IUserRepository
    {
        private readonly ApplicationDbContext _context;
        public UserRepository(ApplicationDbContext context)
        {
            _context = context;
        }
        public async Task CreateUserAsync(User user)
        {
            await _context.Users.AddAsync(user);
            await _context.SaveChangesAsync();
        }

        public async Task<Customer> GetCustomerAsync(Guid id)
        {
            var customer = await _context.Customers.Include(c => c.Address).
                FirstOrDefaultAsync(customer => customer.Id == id);
            return customer;
        }

        public async Task<User> GetUserAsync(Guid id)
        {
            var user = await _context.Users.FindAsync(id);
            return user;
        }

        public async Task CreateCustomerAsync(Customer user)
        {
            await _context.Customers.AddAsync(user);
            await _context.SaveChangesAsync();
        }

        public async Task<List<Customer>> GetCustomersAsync()
        {
            var customers = await _context.Customers.Include(customer => customer.Address).ToListAsync();
            return customers;
        }

        public async Task<List<User>> GetUsersAsync()
        {
            return await _context.Users.ToListAsync();
        }

        public async Task UpdateCustomerAsync(Customer customer)
        {
            var currentCustomer = await GetCustomerAsync(customer.Id);
            if (currentCustomer != null)
            {
                _context.Customers.Update(customer);
            }
                await _context.SaveChangesAsync();
        }

        public async Task UpdateAddressAsync(Address address)
        {
            _context.Addresses.Update(address);
            await _context.SaveChangesAsync();
        }

        public async Task UpdateUserAsync(User user)
        {
            var currentUser = await GetUserAsync(user.Id);
            if (currentUser != null)
            {
                _context.Users.Update(user);
            }
                await _context.SaveChangesAsync();
        }

        public async Task DeleteCustomerAsync(Guid id)
        {
            var currentCustomer = await GetCustomerAsync(id);
            _context.Customers?.Remove(currentCustomer);
            await _context.SaveChangesAsync();
        }

        public async Task DeleteUserAsync(Guid id)
        {
            var currentUser = await GetUserAsync(id);
            _context.Users?.Remove(currentUser);
            await _context.SaveChangesAsync();
        }

    }
}


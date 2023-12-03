using AppDomain.Modules.ProductsModule.Entities;
using AppDomain.Modules.UserModule.Entities;
using Microsoft.EntityFrameworkCore;

namespace AppInfra.Data
{
    public class ApplicationDbContext : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Server=(localdb)\mssqllocaldb;Database=jirayaDb");
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Customer> Customers { get; set; }
        public DbSet<Address> Addresses { get; set; }
        public DbSet<Product> Products { get; set; }
        public DbSet<ProductImage> ProductImages { get; set; }
        public DbSet<ProductOrder> ProductOrders { get; set; }
    }
}